prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.3'
,p_default_workspace_id=>10000
,p_default_application_id=>9107
,p_default_id_offset=>0
,p_default_owner=>'JMR'
);
end;
/
 
prompt APPLICATION 9107 - JTL Item Translation Demo
--
-- Application Export:
--   Application:     9107
--   Name:            JTL Item Translation Demo
--   Date and Time:   13:54 Friday September 4, 2026
--   Exported By:     CAV_AI_DEV
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 1036953622393257522
--   Manifest End
--   Version:         26.1.3
--   Instance ID:     203769285900703
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/item_type/jmr_mls_jtlitem
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(1036953622393257522)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'JMR.MLS.JTLITEM'
,p_display_name=>'JTL Item'
,p_apexlang_name=>'jtlItem'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS:APEX_APPL_PAGE_IG_COLUMNS'
,p_image_prefix=>'&G_APEX_NITRO_IMAGES.'
,p_javascript_file_urls=>'#PLUGIN_FILES#js/jtl_item#MIN#.js'
,p_css_file_urls=>'#PLUGIN_FILES#css/jtl_item#MIN#.css'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'subtype gt_string is varchar2(32767);',
'',
'subtype scope_name_t is varchar2(60);',
'',
'',
'-- CONSTANTS',
'/**',
' * @constant gc_scope_prefix Standard logger package name',
' */',
'gc_scope_prefix constant VARCHAR2(31) := lower($$PLSQL_UNIT) || ''.'';',
'',
'',
'',
'procedure log(p_msg in varchar2, p_scope  in varchar2)',
'is',
'begin',
'',
'  $IF $$OOS_LOGGER $THEN',
'  logger.log(p_msg, p_scope);',
'  $ELSE',
'  apex_debug.message(p_scope || '':'' || substr(p_msg,1,3000));',
'  $END',
'',
'end log;',
'',
'',
'procedure log_error(p_msg in varchar2, p_scope  in varchar2)',
'is',
'begin',
'',
'  $IF $$LOGGER $THEN',
'  logger.log_error(p_msg, p_scope);',
'  $ELSE',
'  apex_debug.message(p_scope || '': '' || p_msg);',
'  $END',
'',
'end log_error;',
'',
'',
'',
'/**',
' * given a JTL JSON structure find the display value for the language',
' *',
' *',
' * @example',
' * ',
' * @issue',
' *',
' * @author Jorge Rimblas',
' * @created May 21, 2020',
' * @param x_result_status',
' * @return',
' */',
'procedure set_display_value(',
'      p_jtl_value     in  gt_string',
'    , p_for_language  in  gt_string',
'    , x_display_value out gt_string',
'    , x_language      out gt_string',
'  )',
'is',
'  $IF $$OOS_LOGGER $THEN',
'  l_scope  logger_logs.scope%type := gc_scope_prefix || ''set_display_value'';',
'  $ELSE',
'  l_scope scope_name_t := gc_scope_prefix || ''set_display_value'';',
'  $END',
'',
'  l_language          gt_string;',
'  l_display_value     gt_string;',
'',
'  l_idx               number;',
'  l_count             number;',
'  l_found             boolean := false;',
'',
'begin',
'  log(''BEGIN'', l_scope);',
'',
'  -- get the value for the language',
'  apex_json.parse(p_jtl_value);',
'  log(''parsing:'' || p_jtl_value, l_scope);',
'  l_count := apex_json.get_count(p_path => ''.'');',
'  log(''language count:'' || l_count, l_scope);',
'',
'  l_idx := 1;',
'  l_found := false;',
'  while not l_found and l_idx <= nvl(l_count,0) loop',
'    l_language := apex_json.get_varchar2(p_path => ''[%d].l'', p0 => l_idx);',
'    log(''language:'' || l_language, l_scope);',
'',
'    if l_language = p_for_language then',
'      l_display_value := apex_json.get_varchar2(p_path => ''[%d].tl'', p0 => l_idx);',
'      log(''Translation:'' || l_display_value, l_scope);',
'      l_found := true;',
'    end if;',
'    l_idx := l_idx + 1;',
'    ',
'  end loop;',
'',
'  -- If we didn''t find a language match, default to the first entry',
'  if not l_found then',
'    l_language := apex_json.get_varchar2(p_path => ''[%d].l'', p0 => 1);',
'    l_display_value := apex_json.get_varchar2(p_path => ''[%d].tl'', p0 => 1);',
'    apex_debug.message(''Didn''''t find a language match, using the 1st language: %s'', l_language);',
'  end if;',
'',
'  x_language := l_language;',
'  x_display_value := l_display_value;',
'',
'  log(''END'', l_scope);',
'',
'  exception',
'    when OTHERS then',
'      log_error(''Unhandled Exception'', l_scope);',
'      raise;',
'end set_display_value;',
'',
'',
'',
'',
'------------------------------------------------------------------------------',
'/**',
' * Render the item as a hidden and display combo.',
' * Original concept for using JSON columns to store language: Bruno Mailloux',
' *',
' * ',
' * @issue',
' *',
' * @author Jorge Rimblas',
' * @created September 19, 2016',
' * @param p_item Standard plugin parameters',
' * @return',
' */',
'procedure render  (',
'    p_item     in apex_plugin.t_item',
'  , p_plugin   in apex_plugin.t_plugin',
'  , p_param    in apex_plugin.t_item_render_param',
'  , p_result   in out nocopy apex_plugin.t_item_render_result ',
')',
'is',
'  $IF $$OOS_LOGGER $THEN',
'  l_scope  logger_logs.scope%type := gc_scope_prefix || ''render'';',
'  $ELSE',
'  l_scope scope_name_t := gc_scope_prefix || ''render'';',
'  $END',
'',
'  c_name           constant varchar2(30) := apex_plugin.get_input_name_for_item;',
'',
'  l_default_language        gt_string;',
'  l_language                gt_string;',
'  l_edit_languages          boolean := false;',
'  l_languages_list          gt_string;',
'  l_dialog_title            gt_string := p_item.plain_label;',
'  l_messages                gt_string;',
'',
'  l_name              varchar2(255);',
'  l_display_value     gt_string;',
'  l_item_type         gt_string;',
'',
'  l_onload_code       gt_string;',
'',
'  l_crlf              char(2) := chr(13)||chr(10);',
'',
'begin',
'  log(''START'', l_scope);',
'',
'  l_messages := p_plugin.attributes.get_varchar2(''attribute_02''); -- for MLS messages',
'  l_languages_list := apex_plugin_util.get_plsql_function_result(p_plugin.attributes.get_varchar2(''attribute_01'')); -- Enabled Language List',
'',
'  apex_debug.message(''Default language: %s'', p_item.attributes.get_varchar2(''attribute_01''));',
'  apex_debug.message(''Edit languages: %s'', p_item.attributes.get_varchar2(''attribute_02''));',
'  apex_debug.message(''Item Type: %s'', p_item.attributes.get_varchar2(''attribute_03''));',
'',
'  -- API v3 no longer substitutes attribute values automatically',
'  l_default_language := coalesce(p_item.attributes.get_varchar2(''attribute_01'', p_do_substitutions => true)',
'                               , apex_util.get_session_lang);',
'  l_edit_languages := apex_plugin_util.get_plsql_func_result_boolean(p_item.attributes.get_varchar2(''attribute_02''));',
'  l_item_type := coalesce(p_item.attributes.get_varchar2(''attribute_03''), ''TEXT'');',
'  -- l_ig_mode := (p_item.component_type_id = apex_component.c_comp_type_ig_column);',
'',
'  if l_default_language is null then',
'    select application_primary_language',
'      into l_default_language',
'      from apex_applications',
'     where application_id = apex_application.get_application_id;',
'     log(''fallback language:'' || l_default_language, l_scope);',
'  end if;',
'',
'',
'  log(''l_languages_list:'' || l_languages_list, l_scope);',
'  log(''l_default_language:'' || l_default_language, l_scope);',
'',
'  apex_plugin_util.debug_item(p_plugin, p_item);',
'',
'',
'  if p_param.value is null or p_param.value_set_by_controller then',
'    l_language := l_default_language;',
'    l_display_value := null;',
'  else',
'    set_display_value(',
'        p_jtl_value     => p_param.value',
'      , p_for_language  => l_default_language',
'      , x_display_value => l_display_value',
'      , x_language      => l_language',
'    );',
'  end if;',
'',
'',
'  -- If a page item saves state, we have to call the get_input_name_for_page_item',
'  -- to render the internal hidden p_arg_names field. It will also return the',
'  -- HTML field name which we have to use when we render the HTML input field.',
'  l_name := apex_plugin.get_input_name_for_page_item(p_is_multi_value=>false);',
'',
'  apex_plugin_util.print_hidden_if_readonly (',
'       p_item_name           => p_item.name',
'     , p_value               => p_param.value',
'     , p_is_readonly         => p_param.is_readonly',
'     , p_is_printer_friendly => p_param.is_printer_friendly',
'  );',
'',
'  if p_param.is_readonly or p_param.is_printer_friendly then ',
'    log(''.. display only'', l_scope); ',
'',
'    apex_plugin_util.print_display_only(',
'        p_item_name        => p_item.name',
'      , p_display_value    => l_display_value',
'      , p_show_line_breaks => false',
'      , p_escape           => p_item.escape_output',
'      , p_attributes       => p_item.element_attributes',
'    );',
'',
'    -- Tell APEX that this field is NOT navigable',
'    p_result.is_navigable := false;',
'  else',
'',
'    -- now render the visible element',
'    if l_item_type = ''TEXT'' then',
'      sys.htp.prn(',
'          ''<input type="text"''',
'               || apex_plugin_util.get_element_attributes(p_item, c_name, ''jtlitem apex-item-text text_field'')',
'               || ''size="'' || p_item.element_width||''" ''',
'               || ''maxlength="''||p_item.element_max_length||''" ''',
'               || ''data-lang="'' || sys.htf.escape_sc(l_language) || ''" ''',
'               || p_item.element_attributes',
'               || ''value="'');',
'      apex_plugin_util.print_escaped_value(l_display_value);',
'      sys.htp.prn(''"'');',
'      sys.htp.prn('' data-value="'');',
'      apex_plugin_util.print_escaped_value(p_param.value);',
'      sys.htp.prn(''"/>'');',
'    else',
'      -- Textareas don''t use a value attribute, instead they contain their value ',
'      -- in between the tags. Therefore, make sure not to add any spaces or other',
'      -- characters that are not part of the value.',
'      sys.htp.prn(',
'          ''<textarea ''',
'               || apex_plugin_util.get_element_attributes(p_item, c_name, ''jtlitem apex-item-textarea textarea'')',
'               || ''data-lang="'' || sys.htf.escape_sc(l_language) || ''" ''',
'               || ''maxlength="''||p_item.element_max_length||''" ''',
'               || ''cols="'' || p_item.element_width||''" ''',
'               || ''rows="'' || p_item.element_height||''" ''',
'               || p_item.element_attributes);',
'      sys.htp.prn('' data-value="'');',
'      apex_plugin_util.print_escaped_value(p_param.value);',
'      sys.htp.prn(''"/>'');',
'      sys.htp.prn(apex_plugin_util.escape(p_value => l_display_value, p_escape => p_item.escape_output));',
'      sys.htp.prn(''</textarea>'');',
'    end if;',
'',
'    if l_edit_languages then',
'      sys.htp.p(''<button type="button" class="jtlitem-modal-open a-Button">'' || l_crlf',
'             || ''  <span class="t-Icon fa fa-globe"></span>'' || l_crlf',
'             || ''</button>'' || l_crlf',
'             );',
'    end if;',
'',
'    apex_javascript.add_onload_code (',
'      p_code => ''$("#''|| p_item.name || ''").jtlItem({'' || l_crlf',
'                      || apex_javascript.add_attribute(''itemName'', p_item.name, true, true) || l_crlf',
'                      || apex_javascript.add_attribute(''lang'', l_language, true, true) || l_crlf',
'                      || apex_javascript.add_attribute(''lang_codes'', l_languages_list, false, true) || l_crlf',
'                      || apex_javascript.add_attribute(''messages'', l_messages, false, true) || l_crlf',
'                      || apex_javascript.add_attribute(''itemType'', l_item_type, false, true) || l_crlf',
'                      || apex_javascript.add_attribute(''dialogTitle'', l_dialog_title, false, true) || l_crlf',
'                      || apex_javascript.add_attribute(''controllerMode'', p_param.value_set_by_controller, false, false) || l_crlf',
'             || ''});''',
'            );',
'  end if; -- display_only section',
'',
'',
'',
'  exception',
'    when OTHERS then',
'      apex_debug.error(''Unhandled Exception'');',
'      raise;',
'end render;',
'',
'',
'',
'procedure metadata (',
'  p_item   in            apex_plugin.t_item,',
'  p_plugin in            apex_plugin.t_plugin,',
'  p_param  in            apex_plugin.t_item_meta_data_param,',
'  p_result in out nocopy apex_plugin.t_item_meta_data_result )',
'is',
'  $IF $$OOS_LOGGER $THEN',
'  l_scope  logger_logs.scope%type := gc_scope_prefix || ''metadata'';',
'  $ELSE',
'  l_scope scope_name_t := gc_scope_prefix || ''render'';',
'  $END',
'begin',
'  log(''START'', l_scope);',
'',
'  -- apex_debug.message(''p_item.value %s'', p_param.value);',
'  p_result.escape_output := true;',
'end metadata;',
'',
'',
'',
'/**',
' * Perform validations on the submitted data:',
' *  - Ensure the data is JSON format',
' *  - Ensure the JSON format is of the expected form',
' *',
' *',
' * @example',
' * ',
' * @issue',
' *',
' * @author Jorge Rimblas',
' * @created October 7, 2016',
' * @param',
' * @return',
' */',
'procedure validate (',
'    p_item   in            apex_plugin.t_item',
'  , p_plugin in            apex_plugin.t_plugin',
'  , p_param  in            apex_plugin.t_item_validation_param',
'  , p_result in out nocopy apex_plugin.t_item_validation_result',
')',
'is',
'  $IF $$OOS_LOGGER $THEN',
'  l_scope  logger_logs.scope%type := gc_scope_prefix || ''validate'';',
'  $ELSE',
'  l_scope scope_name_t := gc_scope_prefix || ''validate'';',
'  $END',
'',
'  l_default_language  gt_string;',
'  l_languages_list    gt_string;',
'  l_language          gt_string;',
'  l_display_value     gt_string;',
'  l_error_suffix      gt_string;',
'',
'  l_idx               number;',
'  l_count             number;',
'  l_found_empty       boolean := false;',
'',
'begin',
'',
'  apex_debug.message(''BEGIN'');',
'',
'  l_default_language := coalesce(p_item.attributes.get_varchar2(''attribute_01'', p_do_substitutions => true)',
'                               , apex_util.get_session_lang);',
'  l_languages_list := apex_plugin_util.get_plsql_function_result(p_plugin.attributes.get_varchar2(''attribute_01'')); -- Enabled Language List',
'',
'  apex_json.parse(p_param.value);',
'  apex_debug.message(''parsing: %s'', p_param.value);',
'  l_count := apex_json.get_count(p_path => ''.'');',
'  apex_debug.message(''lagunages count: %s'', l_count);',
'',
'  -- The item is required, check the "tl" attributes to see if the value is present',
'  if p_item.is_required then',
'    apex_debug.message(''p_item.is_required = true'', l_count);',
'    l_idx := 1;',
'    l_found_empty := false;',
'    -- loop through all the languages or until we find an empty one.',
'    while not l_found_empty and l_idx <= nvl(l_count,0) loop',
'      -- get the current language',
'      l_language := apex_json.get_varchar2(p_path => ''[%d].l'', p0 => l_idx);',
'      -- get the translation value for the language',
'      l_display_value := apex_json.get_varchar2(p_path => ''[%d].tl'', p0 => l_idx);',
'',
'      apex_debug.message(''language: %s'', l_language);',
'',
'      if l_display_value is null then',
'        -- this one is null, so we will return a required value error',
'        l_found_empty := true;',
'        if l_language = l_default_language then',
'          apex_debug.message(''The current language is null'');',
'          l_error_suffix := '''';',
'        else',
'          -- Hmmm, the language that is null is NOT the one displayed to the user',
'          -- add the language code as a prefix to the error.',
'          apex_debug.message(''A different language is null'');',
'          l_error_suffix := ''['' || l_language || ''] '';',
'        end if;',
'      end if;',
'      l_idx := l_idx + 1;',
'      ',
'    end loop;',
'',
'  end if;',
'',
'  if l_found_empty then',
'    -- Define APEX.PAGE_ITEM_IS_REQUIRED in your language.',
'    p_result.message := wwv_flow_lang.system_message(''APEX.PAGE_ITEM_IS_REQUIRED'');',
'    -- if p_result.message = ''APEX.PAGE_ITEM_IS_REQUIRED'' then',
'    --   -- message not defined yet',
'    --   p_result.message := apex_lang.message(''#LABEL# must have some value.'');',
'    -- end if;',
'    -- add the language suffix, if the error doesn''t apply to the language being displayed.',
'    p_result.message := l_error_suffix || p_result.message;',
'  else',
'    p_result.message := '''';',
'  end if;',
'',
'exception',
'  when apex_json.e_parse_error then',
'    -- Somehow we don''t have valid JSON in our item.',
'    -- This is more critical for 11g where we don''t have "is json" constraints',
'    p_result.message := ''The JSON structure for #LABEL# is invalid.'';',
'',
'end validate;',
''))
,p_api_version=>3
,p_render_function=>'render'
,p_meta_data_function=>'metadata'
,p_validation_function=>'validate'
,p_item_session_state_data_type=>'VARCHAR2'
,p_standard_attributes=>'VISIBLE:FORM_ELEMENT:SESSION_STATE:READONLY:ESCAPE_OUTPUT:QUICKPICK:SOURCE:ELEMENT:WIDTH:HEIGHT:PLACEHOLDER'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Plugin for storing multi-language translations (MLS) in a JSON column.',
'',
'For better plugin render performance switch from the inline code to the package code.  Change the render, metadata, and validate procedures to tk_jtl_plugin.render, tk_jtl_plugin.metadata and tk_jtl_plugin.validate. Then REMOVE the inline code or you'
||' will not get the performance improvement.'))
,p_version_identifier=>'2.0.0'
,p_about_url=>'https://github.com/rimblas/jtlitem'
,p_files_version=>2461288135414
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1036953815085259240)
,p_plugin_id=>wwv_flow_imp.id(1036953622393257522)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'attribute_01'
,p_prompt=>'Enabled Language List'
,p_apexlang_name=>'enabledLanguageList'
,p_attribute_type=>'PLSQL FUNCTION BODY'
,p_is_required=>true
,p_default_value=>'return ''["en","fr","es"]'';'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The Enabled Language List must be a JavaScript array with the supported application languages. The sort order matters and the first language should be the Application''s Primary Language.<br> ',
'It is recommended that when new languages are enabled for the applicating that the JSON columns be updated to include the new language.'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1036954813828259386)
,p_plugin_id=>wwv_flow_imp.id(1036953622393257522)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>20
,p_static_id=>'attribute_01'
,p_prompt=>'Session Language'
,p_apexlang_name=>'sessionLanguage'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>'This is the language code for the current session. If empty, the plugin will use "apex_util.get_session_lang". Substitution Strings are also supported, for example &BROWSER_LANGUAGE.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1036954077710259361)
,p_plugin_id=>wwv_flow_imp.id(1036953622393257522)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'attribute_02'
,p_prompt=>'Messages'
,p_apexlang_name=>'messages'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_default_value=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'   "applyChanges": "Ok",',
'   "cancelButton": "Cancel",',
'   "languageLabel": "Language",',
'   "languageValue": "Translation",',
'   "noDataFound": "No specified languages.",',
'   "valueValidationError": "#LABEL# contains an invalid value."',
'}'))
,p_display_length=>80
,p_max_length=>4000
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Use this setting to specify what messages should be displayed to users in different parts of the plugin. The default values are:<br />',
'<pre>',
'{',
'   "applyChanges": "Apply Changes",',
'   "cancelButton": "Cancel",',
'   "languageLabel": "Language",',
'   "languageValue": "Translation",',
'   "noDataFound": "No specified languages.",',
'   "valueValidationError": "#LABEL# contains an invalid value."',
'}',
'</pre>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(1036954397717259374)
,p_plugin_id=>wwv_flow_imp.id(1036953622393257522)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>30
,p_static_id=>'attribute_02'
,p_prompt=>'Edit Languages'
,p_apexlang_name=>'editLanguages'
,p_attribute_type=>'PLSQL FUNCTION BODY BOOLEAN'
,p_is_required=>true
,p_default_value=>'return true;'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Return true or false. When true a button to edit all the languages will be present. The button will open a dialog that will allow the user to edit all the languages specified in the "Language List" parameter.<br>',
'When false and a new record is created the "Installed Languages" Application plugin attribute will be used to seed all available languages.'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(913269705145016968)
,p_plugin_id=>wwv_flow_imp.id(1036953622393257522)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>10
,p_static_id=>'attribute_03'
,p_prompt=>'Subtype'
,p_apexlang_name=>'subtype'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'TEXT'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_help_text=>'Will select the type of item to display: Regular Text Input or Text Area'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(913274079849018756)
,p_plugin_attribute_id=>wwv_flow_imp.id(913269705145016968)
,p_display_sequence=>10
,p_display_value=>'Text'
,p_return_value=>'TEXT'
,p_apexlang_name=>'text'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(913274412013019815)
,p_plugin_attribute_id=>wwv_flow_imp.id(913269705145016968)
,p_display_sequence=>20
,p_display_value=>'Textarea'
,p_return_value=>'TEXTAREA'
,p_apexlang_name=>'textarea'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E6A746C6974656D2D636F6E74656E74207B0A20206D617267696E3A203020313070783B0A7D0A2E6A746C6974656D2D636F6E74656E74207461626C65207B0A20206D617267696E3A203130707820303B0A7D0A2E6A746C6974656D2D636F6E74656E74';
wwv_flow_imp.g_varchar2_table(2) := '207461626C652074722E73656C6563746564207B0A20206F75746C696E653A2031707820646173686564206F72616E67653B0A7D0A2E6A746C6974656D2D636F6E74656E74207461626C652074722E73656C65637465642074647B0A20206261636B6772';
wwv_flow_imp.g_varchar2_table(3) := '6F756E642D636F6C6F723A20236637663762613B0A7D0A2E6A746C6974656D2D627574746F6E2D636F6E7461696E6572202E75692D69636F6E207B0A2020646973706C61793A20696E6C696E652D626C6F636B3B0A7D0A2E6A746C6974656D2D62757474';
wwv_flow_imp.g_varchar2_table(4) := '6F6E2D636F6E7461696E6572207B0A202070616464696E673A2035707820313070783B0A2020706F736974696F6E3A2072656C61746976653B0A2020666C6F61743A2072696768743B0A7D0A0A2F2A2320736F757263654D617070696E6755524C3D6A74';
wwv_flow_imp.g_varchar2_table(5) := '6C5F6974656D2E6373732E6D6170202A2F0A';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(15542975336005935)
,p_plugin_id=>wwv_flow_imp.id(1036953622393257522)
,p_file_name=>'css/jtl_item.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '7B2276657273696F6E223A332C22736F7572636573223A5B226A746C5F6974656D2E637373225D2C226E616D6573223A5B5D2C226D617070696E6773223A22414141413B454143452C634141633B41414368423B414143413B454143452C634141633B41';
wwv_flow_imp.g_varchar2_table(2) := '414368423B414143413B454143452C3042414130423B41414335423B414143413B454143452C7942414179423B41414333423B414143413B454143452C7142414171423B41414376423B414143413B454143452C6942414169423B4541436A422C6B4241';
wwv_flow_imp.g_varchar2_table(3) := '416B423B4541436C422C594141593B41414364222C2266696C65223A226A746C5F6974656D2E637373222C22736F7572636573436F6E74656E74223A5B222E6A746C6974656D2D636F6E74656E74207B5C6E20206D617267696E3A203020313070783B5C';
wwv_flow_imp.g_varchar2_table(4) := '6E7D5C6E2E6A746C6974656D2D636F6E74656E74207461626C65207B5C6E20206D617267696E3A203130707820303B5C6E7D5C6E2E6A746C6974656D2D636F6E74656E74207461626C652074722E73656C6563746564207B5C6E20206F75746C696E653A';
wwv_flow_imp.g_varchar2_table(5) := '2031707820646173686564206F72616E67653B5C6E7D5C6E2E6A746C6974656D2D636F6E74656E74207461626C652074722E73656C65637465642074647B5C6E20206261636B67726F756E642D636F6C6F723A20236637663762613B5C6E7D5C6E2E6A74';
wwv_flow_imp.g_varchar2_table(6) := '6C6974656D2D627574746F6E2D636F6E7461696E6572202E75692D69636F6E207B5C6E2020646973706C61793A20696E6C696E652D626C6F636B3B5C6E7D5C6E2E6A746C6974656D2D627574746F6E2D636F6E7461696E6572207B5C6E20207061646469';
wwv_flow_imp.g_varchar2_table(7) := '6E673A2035707820313070783B5C6E2020706F736974696F6E3A2072656C61746976653B5C6E2020666C6F61743A2072696768743B5C6E7D5C6E225D7D0A';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(15543320364005941)
,p_plugin_id=>wwv_flow_imp.id(1036953622393257522)
,p_file_name=>'css/jtl_item.css.map'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E6A746C6974656D2D636F6E74656E747B6D617267696E3A3020313070787D2E6A746C6974656D2D636F6E74656E74207461626C657B6D617267696E3A3130707820307D2E6A746C6974656D2D636F6E74656E74207461626C652074722E73656C656374';
wwv_flow_imp.g_varchar2_table(2) := '65647B6F75746C696E653A31707820646173686564206F72616E67657D2E6A746C6974656D2D636F6E74656E74207461626C652074722E73656C65637465642074647B6261636B67726F756E642D636F6C6F723A236637663762617D2E6A746C6974656D';
wwv_flow_imp.g_varchar2_table(3) := '2D627574746F6E2D636F6E7461696E6572202E75692D69636F6E7B646973706C61793A696E6C696E652D626C6F636B7D2E6A746C6974656D2D627574746F6E2D636F6E7461696E65727B70616464696E673A35707820313070783B706F736974696F6E3A';
wwv_flow_imp.g_varchar2_table(4) := '72656C61746976653B666C6F61743A72696768747D0A';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(15542700808005921)
,p_plugin_id=>wwv_flow_imp.id(1036953622393257522)
,p_file_name=>'css/jtl_item.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A0A202A204A544C204974656D2076312E332E30202D20687474703A2F2F617065782E776F726C642F706C7567696E732F0A202A0A202A204C6963656E73656420756E646572204D4954204C6963656E736520284D4954290A202A204A6F7267652052';
wwv_flow_imp.g_varchar2_table(2) := '696D626C617320C2A920323031372D323032300A2A2F0A0A242E77696467657428202275692E6A746C4974656D222C207B0A200A20202F2F2044656661756C74206F7074696F6E732E0A20206F7074696F6E733A207B0A20202020206C616E673A202265';
wwv_flow_imp.g_varchar2_table(3) := '6E222C0A20202020206C616E675F636F6465733A205B5D2C20202F2F205B22656E222C226672222C226573225D0A20202020206D657373616765733A206E756C6C2C0A20202020206974656D4E616D653A2027272C0A20202020206669656C6453697A65';
wwv_flow_imp.g_varchar2_table(4) := '3A2033302C0A20202020206669656C64526F77733A20352C0A20202020206669656C644D61784C656E6774683A2038302C0A20202020206469616C6F675469746C653A206E756C6C0A20207D2C0A0A20202F2F204C6F6767696E6720666F722022726567';
wwv_flow_imp.g_varchar2_table(5) := '756C617222207465787420656C656D656E74730A20206C6F673A2066756E6374696F6E2829207B0A202020207661722061726773203D2041727261792E70726F746F747970652E6A6F696E2E63616C6C2820617267756D656E74732C20272C202720293B';
wwv_flow_imp.g_varchar2_table(6) := '0A20202020617065782E64656275672E6D65737361676528342C20226A746C6974656D3A222C2061726773293B0A20207D2C0A20202F2F20456E68616E636564206C6F670A20202F2F20616363657074732032206F626A6563747320666F72206C6F6767';
wwv_flow_imp.g_varchar2_table(7) := '696E670A2020656C6F673A2066756E6374696F6E2870312C703229207B0A20202020617065782E64656275672E6D65737361676528342C20226A746C6974656D3A222C2070312C207032293B0A20207D2C0A0A20205F746F70417065783A20617065782E';
wwv_flow_imp.g_varchar2_table(8) := '7574696C2E676574546F704170657828292C0A0A0A20205F6372656174655072697661746553746F726167653A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869732C0A2020202020202020204449414C4F475F504F5055';
wwv_flow_imp.g_varchar2_table(9) := '505F434C415353203D20276A746C6974656D2D6469616C6F67273B0A0A20202020207569772E5F6974656D24203D202428272327202B207569772E6F7074696F6E732E6974656D4E616D65293B0A0A20202020207569772E5F76616C756573203D207B0A';
wwv_flow_imp.g_varchar2_table(10) := '20202020202020206669656C6453697A653A2033302C0A20202020202020206669656C644D61784C656E6774683A2038302C0A2020202020202020646174614A534F4E3A207B7D2C0A2020202020202020637572725F6C616E675F696E6465783A20302C';
wwv_flow_imp.g_varchar2_table(11) := '0A20202020202020206C616E6775616765733A207B7D2C0A20202020202020207461674D61703A207B7D2C0A20202020202020206D657373616765733A204A534F4E2E7061727365287569772E6F7074696F6E732E6D65737361676573292C0A20202020';
wwv_flow_imp.g_varchar2_table(12) := '20202020746F74616C4C616E6775616765733A20302C0A202020202020202064697361626C65643A2066616C73652C0A20202020202020206E65775265636F72643A2066616C73652C0A2020202020202020706F707570436C6173733A204449414C4F47';
wwv_flow_imp.g_varchar2_table(13) := '5F504F5055505F434C4153532C0A2020202020202020706F70757053454C3A20276469762E27202B204449414C4F475F504F5055505F434C4153532C0A2020202020202020636F6E74726F6C6C65724D6F64653A207569772E6F7074696F6E732E636F6E';
wwv_flow_imp.g_varchar2_table(14) := '74726F6C6C65724D6F64650A20202020207D3B0A0A20202020207569772E5F656C656D656E7473203D207B0A20202020202020202477696E646F773A207B7D2C0A202020202020202024646F63756D656E743A207B7D2C0A202020202020202024626F64';
wwv_flow_imp.g_varchar2_table(15) := '793A207B7D2C0A2020202020202020246974656D7365743A207B7D2C0A2020202020202020246D6C73427574746F6E3A207B7D2C0A20202020202020202469673A207B7D2C0A202020202020202024677269643A207B7D2C0A2020202020202020246469';
wwv_flow_imp.g_varchar2_table(16) := '616C6F673A207B7D2C0A2020202020202020246469616C6F67436F6E74656E743A207B7D2C0A20202020202020202473617665427574746F6E3A207B7D2C0A20202020202020202463616E63656C427574746F6E3A207B7D2C0A20202020202020202462';
wwv_flow_imp.g_varchar2_table(17) := '7574746F6E436F6E7461696E65723A207B7D0A20202020207D3B0A20207D2C0A0A0A0A20205F6372656174653A2066756E6374696F6E2829207B0A2020202076617220756977203D20746869732C0A2020202020202020696E69744A534F4E203D207B7D';
wwv_flow_imp.g_varchar2_table(18) := '3B0A0A202020202F2F204F7074696F6E732061726520616C7265616479206D657267656420616E642073746F72656420696E20746869732E6F7074696F6E7320286F72207569772E6F7074696F6E73290A202020207569772E6C6F6728225F6372656174';
wwv_flow_imp.g_varchar2_table(19) := '6522293B0A202020207569772E6C6F67287569772E6F7074696F6E732E6974656D4E616D65293B0A0A202020207569772E5F616464435353546F546F704C6576656C28293B0A0A202020207569772E5F6372656174655072697661746553746F72616765';
wwv_flow_imp.g_varchar2_table(20) := '28293B0A202020207569772E5F696E6974456C656D656E747328293B0A202020207569772E5F696E697442617365456C656D656E747328293B0A0A0A20202020747279207B7569772E5F76616C7565732E6C616E677561676573203D204A534F4E2E7061';
wwv_flow_imp.g_varchar2_table(21) := '727365287569772E6F7074696F6E732E6C616E675F636F646573293B7D0A20202020636174636820286529207B636F6E736F6C652E6572726F72282254686520646566696E6564206C616E67756167657320617265206E6F7420666F726D617474656420';
wwv_flow_imp.g_varchar2_table(22) := '636F72726563746C792E205365652053686172656420436F6D706F6E657473203E20436F6D706F6E656E74732053657474696E6773203E204A544C204974656D205B506C75672D696E5D222C207569772E6F7074696F6E732E6C616E675F636F64657329';
wwv_flow_imp.g_varchar2_table(23) := '3B7D0A202020207569772E5F76616C7565732E746F74616C4C616E677561676573203D207569772E5F76616C7565732E6C616E6775616765732E6C656E6774683B0A0A2020202069662028217569772E5F76616C7565732E636F6E74726F6C6C65724D6F';
wwv_flow_imp.g_varchar2_table(24) := '6465207C7C207569772E656C656D656E742E64617461282276616C756522292029207B0A2020202020202F2F2057652061726520616E206E6F7420616E20494720636F6C756D6E20287768657265207468652076616C7565206973207365742076696120';
wwv_flow_imp.g_varchar2_table(25) := '646973706C617956616C7565466F7229200A2020202020202F2F206F722077652061726520616E206974656D207769746820616E20696E697469616C2076616C75650A202020202020696E69744A534F4E203D207569772E656C656D656E742E64617461';
wwv_flow_imp.g_varchar2_table(26) := '282276616C756522293B0A202020207D0A0A202020202F2F2073657420746865206672657368206C697374206F66206C616E6775616765730A202020207569772E5F696E6974446174614A534F4E28696E69744A534F4E293B0A0A202020202F2F205768';
wwv_flow_imp.g_varchar2_table(27) := '69636820706F736974696F6E206C616E677561676520617265207765207573696E670A202020207569772E5F76616C7565732E637572725F6C616E675F696E646578203D207569772E5F6765744C616E6775616765496E646578287569772E6F7074696F';
wwv_flow_imp.g_varchar2_table(28) := '6E732E6C616E67293B0A202020200A202020202F2F2053796E63206F7572204A534F4E20646174612D76616C7565206174747269627574652077697468207468652061637475616C2076616C756520696E2074686520636F7272656374206C616E677561';
wwv_flow_imp.g_varchar2_table(29) := '67652C206275740A202020202F2F20616C736F20647572696E672070616765207375626D697420746F206D616B652073757265207765207375626D69742074686520636F72726563742076616C7565200A202020207569772E5F6974656D240A20202020';
wwv_flow_imp.g_varchar2_table(30) := '2020202E62696E6428276368616E6765272C207B7569773A207569777D2C207569772E5F73796E634A534F4E64617461293B0A202020207569772E5F656C656D656E74732E24646F63756D656E740A202020202020202E62696E64282761706578626566';
wwv_flow_imp.g_varchar2_table(31) := '6F7265706167657375626D6974272C207B7569773A207569777D2C207569772E5F73796E634A534F4E64617461293B0A0A202020207569772E5F656C656D656E74732E246D6C73427574746F6E0A202020202020202E62696E642827636C69636B272C20';
wwv_flow_imp.g_varchar2_table(32) := '7B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69636B293B0A0A202020202F2F20496E6974204150455820706167656974656D2066756E6374696F6E730A202020207569772E5F696E6974417065784974656D28293B0A0A2020';
wwv_flow_imp.g_varchar2_table(33) := '20202F2F20617065782E6A51756572792877696E646F77292E6F6E28227468656D6534327265616479222C2066756E6374696F6E2829207B0A20202020617065782E6A51756572792877696E646F77292E6F6E2822696E74657261637469766567726964';
wwv_flow_imp.g_varchar2_table(34) := '766965776D6F64656C637265617465222C2066756E6374696F6E286576656E742C20756929207B202F2F2077696C6C207468697320776F726B20666F72206D756C7469706C652049473F0A2020202020202F2F20696E6974207468652067726964207661';
wwv_flow_imp.g_varchar2_table(35) := '6C7565732C20627574207761697420756E74696C2074686520677269642069732072656164790A2020202020207569772E5F696E697447726964436F6E66696728293B0A202020207D293B0A0A20207D2C0A0A0A20205F696E697447726964436F6E6669';
wwv_flow_imp.g_varchar2_table(36) := '673A2066756E6374696F6E202829207B0A2020202076617220756977203D20746869732C0A2020202020202020726567696F6E203D20617065782E726567696F6E2E66696E64436C6F73657374287569772E5F6974656D245B305D293B0A0A2020202075';
wwv_flow_imp.g_varchar2_table(37) := '69772E6C6F6728225F696E697447726964436F6E66696722293B0A202020207569772E656C6F6728227569772E5F6974656D24222C207569772E5F6974656D24293B0A202020207569772E656C6F672822726567696F6E222C20726567696F6E293B0A0A';
wwv_flow_imp.g_varchar2_table(38) := '20202020696620287569772E5F76616C7565732E636F6E74726F6C6C65724D6F646529207B0A2020202020202F2F207569772E5F656C656D656E74732E2467726964203D20726567696F6E2E77696467657428292E696E74657261637469766547726964';
wwv_flow_imp.g_varchar2_table(39) := '282267657443757272656E745669657722293B0A2020202020207569772E5F656C656D656E74732E246967203D20726567696F6E2E77696467657428292E696E7465726163746976654772696428293B0A2020202020207569772E5F656C656D656E7473';
wwv_flow_imp.g_varchar2_table(40) := '2E2467726964203D20726567696F6E2E77696467657428292E696E746572616374697665477269642822676574566965777322292E677269643B0A2020202020207569772E656C6F6728225F656C656D656E74732E24677269643A222C207569772E5F65';
wwv_flow_imp.g_varchar2_table(41) := '6C656D656E74732E2467726964293B0A0A2F2A0A202020202020726567696F6E2E77696467657428292E6F6E2822696E7465726163746976656772696473617665222C2066756E6374696F6E2829207B0A20202020202020202F2F20576F756C64206C69';
wwv_flow_imp.g_varchar2_table(42) := '6B6520746F2063616C6C20636C65617253656C656374696F6E282920696E73746561642C206275742063616E277420666967757265206F757420686F772E0A20202020202020202F2F205475726E2065646974206F666620746F20666F72636520612066';
wwv_flow_imp.g_varchar2_table(43) := '72657368206C6F6164206F66206461746120616761696E2E0A20202020202020202F2F205965732C2074686973206973206120746F74616C206861636B2C20616E6420776F756C64206C6F766520746F206C6561726E206F662061206265747465722061';
wwv_flow_imp.g_varchar2_table(44) := '7070726F6163680A20202020202020207569772E5F656C656D656E74732E24677269642E736574456469744D6F64652866616C7365293B0A2020202020207D293B0A2A2F0A0A202020207D0A20202020656C7365207B0A2020202020207569772E6C6F67';
wwv_flow_imp.g_varchar2_table(45) := '28226E6F7420616E20494722293B0A202020207D0A0A20207D2C0A0A0A20205F7265736574466F6375733A2066756E6374696F6E202829207B0A2020202076617220756977203D20746869733B0A0A202020207569772E6C6F6728225F7265736574466F';
wwv_flow_imp.g_varchar2_table(46) := '63757322293B0A0A20202020696620287569772E5F76616C7565732E636F6E74726F6C6C65724D6F646529207B20202F2F2061726520776520696E73696465206120677269643F0A2020202020202F2F2053696E63652077652068617665206120617065';
wwv_flow_imp.g_varchar2_table(47) := '782E6974656D28292E676574506F70757053656C6563746F72207468697320636F6465206973207265616C6C79206E6F74206E65636573736172790A2020202020202F2F20627574206974207365656D7320746F2070726F766964652061206D75636820';
wwv_flow_imp.g_varchar2_table(48) := '626574746572207573657220657870657269656E636520626563617365206F6E63652074686520706F70757020636C6F7365730A2020202020202F2F207765277265206261636B2065646974696E67207468652063656C6C206173206F70706F73656420';
wwv_flow_imp.g_varchar2_table(49) := '746F20686176696E6720746F20666F726365207468652065646974696E672E0A0A2020202020202F2F207569772E656C6F6728227569772E5F656C656D656E74732E2467726964222C207569772E5F656C656D656E74732E2467726964293B0A20202020';
wwv_flow_imp.g_varchar2_table(50) := '20202F2F207569772E656C6F6728227569772E5F656C656D656E74732E246967222C207569772E5F656C656D656E74732E246967293B0A0A202020202020747279207B0A20202020202020202F2F2066696E64206F757220636F6C756D6E20696E207468';
wwv_flow_imp.g_varchar2_table(51) := '6520677269640A20202020202020202F2F205468616E6B20796F7520746F204D656E6E6F20486F6F67656E64696A6B20666F7220706F7274696F6E73206F66207468697320636F64650A20202020202020202F2F2068747470733A2F2F6769746875622E';
wwv_flow_imp.g_varchar2_table(52) := '636F6D2F6D656E6E6F6F6F2F6F72636C617065782D6D6F64616C2D6C6F760A0A2020202020202020766172207265636F72644964203D207569772E5F656C656D656E74732E24677269642E6D6F64656C2E6765745265636F72644964287569772E5F656C';
wwv_flow_imp.g_varchar2_table(53) := '656D656E74732E24677269642E76696577242E67726964282767657453656C65637465645265636F72647327295B305D293B0A202020202020202076617220636F6C756D6E203D207569772E5F656C656D656E74732E2469672E696E7465726163746976';
wwv_flow_imp.g_varchar2_table(54) := '654772696428276F7074696F6E27292E636F6E6669672E636F6C756D6E732E66696C7465722866756E6374696F6E2028636F6C756D6E29207B0A2020202020202020202072657475726E20636F6C756D6E2E7374617469634964203D3D3D207569772E6F';
wwv_flow_imp.g_varchar2_table(55) := '7074696F6E732E6974656D4E616D653B0A20202020202020207D295B305D3B0A20202020202020202F2F20676F20746F206F75722063656C6C20616E6420666F6375732069742020202020200A20202020202020207569772E5F656C656D656E74732E24';
wwv_flow_imp.g_varchar2_table(56) := '677269642E76696577242E677269642827676F746F43656C6C272C207265636F726449642C20636F6C756D6E2E6E616D65293B0A20202020202020207569772E5F656C656D656E74732E24677269642E666F63757328293B0A2020202020207D0A202020';
wwv_flow_imp.g_varchar2_table(57) := '202020636174636820286529207B0A2020202020202020636F6E736F6C652E7761726E2822546865726520776572652070726F626C656D7320747279696E6720746F207265666F637573206F6E207468652063656C6C206265696E672065646974656422';
wwv_flow_imp.g_varchar2_table(58) := '293B0A2020202020207D0A0A202020207D20656C7365207B0A2020202020202F2F20776520617265206E6F7420696E206120677269642C20736F20666F63757320746865206974656D20746861742063616C6C65642075730A2020202020207569772E5F';
wwv_flow_imp.g_varchar2_table(59) := '6974656D242E747269676765722827666F63757327293B0A202020207D0A20207D2C0A0A0A0A0A20205F696E6974417065784974656D3A2066756E6374696F6E202829207B0A2020202076617220756977203D20746869733B0A0A202020207569772E6C';
wwv_flow_imp.g_varchar2_table(60) := '6F6728225F696E6974417065784974656D222C20225265676973746572696E67207769746820617065782E6974656D2E63726561746520666F722022202B207569772E6F7074696F6E732E6974656D4E616D65293B0A202020202F2F2053657420616E64';
wwv_flow_imp.g_varchar2_table(61) := '206765742076616C75652076696120617065782066756E6374696F6E730A20202020617065782E6974656D2E637265617465287569772E6F7074696F6E732E6974656D4E616D652C207B0A0A2020202020202073657456616C75653A2066756E6374696F';
wwv_flow_imp.g_varchar2_table(62) := '6E287056616C75652C2070446973706C617956616C756529207B0A2020202020202020202076617220746578743B0A0A202020202020202020207569772E6C6F67282022617065782E6974656D2E73657456616C7565222C207056616C75652C20704469';
wwv_flow_imp.g_varchar2_table(63) := '73706C617956616C7565293B0A0A202020202020202020202F2F20546865204A534F4E20696E207056616C75652069732074686520736F75726365206F6620747275746820666F72206576657279207472616E736C6174696F6E0A202020202020202020';
wwv_flow_imp.g_varchar2_table(64) := '207569772E5F696E6974446174614A534F4E284A534F4E2E7061727365287056616C7565207C7C20227B7D2229293B0A0A202020202020202020202F2F20546865206E6577204A534F4E206D6179206F7264657220697473206C616E6775616765732064';
wwv_flow_imp.g_varchar2_table(65) := '6966666572656E746C79206F72206C65617665206F757273206F75742C0A202020202020202020202F2F20736F2066696E64206F7572206C616E677561676520616761696E2E20546865206368616E676520616E64207375626D69742068616E646C6572';
wwv_flow_imp.g_varchar2_table(66) := '73207772697465207468650A202020202020202020202F2F206974656D207465787420696E746F207468617420706F736974696F6E2028736565205F73796E634A534F4E64617461292E0A202020202020202020207569772E5F76616C7565732E637572';
wwv_flow_imp.g_varchar2_table(67) := '725F6C616E675F696E646578203D207569772E5F6765744C616E6775616765496E646578287569772E6F7074696F6E732E6C616E67293B0A0A202020202020202020202F2F2053686F7720746865207472616E736C6174696F6E206F6620746865206375';
wwv_flow_imp.g_varchar2_table(68) := '7272656E74206C616E67756167652E204F6E6C79207768656E20746865204A534F4E206861730A202020202020202020202F2F206E6F6E6520646F207765207573652074686520646973706C61792076616C75652C206F7220616E20656D707479207374';
wwv_flow_imp.g_varchar2_table(69) := '72696E6720776974686F7574206F6E652E0A2020202020202020202074657874203D207569772E5F676574544C287569772E6F7074696F6E732E6C616E67293B0A202020202020202020206966202874657874203D3D3D20756E646566696E6564207C7C';
wwv_flow_imp.g_varchar2_table(70) := '2074657874203D3D3D206E756C6C29207B0A202020202020202020202020202074657874203D2070446973706C617956616C7565207C7C2022223B0A202020202020202020207D0A0A202020202020202020202F2F20416C776179732070617373207468';
wwv_flow_imp.g_varchar2_table(71) := '6520746578743A202E76616C282920776974686F757420616E20617267756D656E7420697320612067657474657220746861740A202020202020202020202F2F206C6561766573207468652070726576696F7573207465787420696E2074686520697465';
wwv_flow_imp.g_varchar2_table(72) := '6D20666F7220746865206368616E67652068616E646C657220746F20736176652E0A202020202020202020207569772E5F6974656D242E76616C2874657874293B0A0A202020202020207D2C0A2020202020202067657456616C75653A2066756E637469';
wwv_flow_imp.g_varchar2_table(73) := '6F6E2829207B0A2020202020202020202072657475726E204A534F4E2E737472696E67696679287569772E5F76616C7565732E646174614A534F4E293B0A202020202020207D2C0A20202020202020736574466F6375733A2066756E6374696F6E282920';
wwv_flow_imp.g_varchar2_table(74) := '7B0A202020202020202020207569772E5F6974656D242E747269676765722822666F63757322293B0A202020202020207D2C0A20202020202020656E61626C653A2066756E6374696F6E2829207B0A202020202020202020207569772E656E61626C6528';
wwv_flow_imp.g_varchar2_table(75) := '293B0A202020202020207D2C0A2020202020202064697361626C653A2066756E6374696F6E2829207B0A202020202020202020207569772E64697361626C6528293B0A202020202020207D2C0A20202020202020676574506F70757053656C6563746F72';
wwv_flow_imp.g_varchar2_table(76) := '3A2066756E6374696F6E2829207B0A2020202020202020202072657475726E207569772E5F76616C7565732E706F70757053454C3B0A202020202020207D2C0A20202020202020646973706C617956616C7565466F723A2066756E6374696F6E20287056';
wwv_flow_imp.g_varchar2_table(77) := '616C756529207B0A2020202020202020202076617220707265766A746C4A534F4E203D207B7D2C0A2020202020202020202020202020707265764E65775265636F72642C0A2020202020202020202020202020707265764C616E67496E6465782C0A2020';
wwv_flow_imp.g_varchar2_table(78) := '2020202020202020202020206A746C4A534F4E203D207B7D2C0A202020202020202020202020202072657475726E56616C75653B0A202020202020202020202F2F205468652049472063616C6C73207468697320636F646520746F207365742074686520';
wwv_flow_imp.g_varchar2_table(79) := '696E697469616C20646973706C61792076616C7565730A202020202020202020207569772E6C6F672822617065782E6974656D2E646973706C617956616C7565466F72222C207056616C7565293B0A20202020202020202020696620287056616C756529';
wwv_flow_imp.g_varchar2_table(80) := '207B0A202020202020202020202020747279207B202F2F206A7573742070726F7465637420757320696620746865204A534F4E20697320696E76616C69640A20202020202020202020202020206A746C4A534F4E203D204A534F4E2E7061727365287056';
wwv_flow_imp.g_varchar2_table(81) := '616C7565293B0A2020202020202020202020207D0A202020202020202020202020636174636820286529207B0A2020202020202020202020207D0A0A0A202020202020202020207D0A202020202020202020202F2F20646973706C617956616C7565466F';
wwv_flow_imp.g_varchar2_table(82) := '722073686F756C64204E4F54206368616E67652073746174652C20736F2073746F72652065766572797468696E6720746861740A202020202020202020202F2F205F696E6974446174614A534F4E206368616E6765732028697420616C736F2073657473';
wwv_flow_imp.g_varchar2_table(83) := '206E65775265636F72642920616E6420726573746F72652069742062656C6F770A20202020202020202020707265766A746C4A534F4E203D207569772E5F76616C7565732E646174614A534F4E3B20202F2F2073746F7265207468652070726576207661';
wwv_flow_imp.g_varchar2_table(84) := '6C75650A20202020202020202020707265764E65775265636F7264203D207569772E5F76616C7565732E6E65775265636F72643B0A20202020202020202020707265764C616E67496E646578203D207569772E5F76616C7565732E637572725F6C616E67';
wwv_flow_imp.g_varchar2_table(85) := '5F696E6465783B0A202020202020202020207569772E5F696E6974446174614A534F4E286A746C4A534F4E293B0A2020202020202020202072657475726E56616C7565203D207569772E5F676574544C287569772E6F7074696F6E732E6C616E67293B0A';
wwv_flow_imp.g_varchar2_table(86) := '202020202020202020207569772E5F696E6974446174614A534F4E28707265766A746C4A534F4E293B2020202020202F2F20726573746F7265207468652076616C75650A202020202020202020207569772E5F76616C7565732E6E65775265636F726420';
wwv_flow_imp.g_varchar2_table(87) := '3D20707265764E65775265636F72643B0A202020202020202020207569772E5F76616C7565732E637572725F6C616E675F696E646578203D20707265764C616E67496E6465783B0A0A202020202020202020202F2F2052657475726E20706C61696E2074';
wwv_flow_imp.g_varchar2_table(88) := '6578743A2049472065736361706573206974207468726F756768206D657461646174612E6573636170655F6F7574707574203D20747275652E0A202020202020202020202F2F204573636170696E6720686572652061732077656C6C20776F756C642064';
wwv_flow_imp.g_varchar2_table(89) := '6F75626C652D657363617065207472616E736C6174696F6E732E0A2020202020202020202072657475726E2072657475726E56616C75653B0A202020202020207D0A202020207D293B0A0A20207D2C0A0A0A0A20202F2F205468616E6B20796F7520746F';
wwv_flow_imp.g_varchar2_table(90) := '204D656E6E6F20486F6F67656E64696A6B20666F72207468697320636F64650A20202F2F2068747470733A2F2F6769746875622E636F6D2F6D656E6E6F6F6F2F6F72636C617065782D6D6F64616C2D6C6F760A20205F616464435353546F546F704C6576';
wwv_flow_imp.g_varchar2_table(91) := '656C3A2066756E6374696F6E202829207B0A2020202076617220756977203D20746869733B0A202020202F2F204353532066696C6520697320616C776179732070726573656E74207768656E207468652063757272656E742077696E646F772069732074';
wwv_flow_imp.g_varchar2_table(92) := '686520746F702077696E646F772C20736F20646F206E6F7468696E670A202020206966202877696E646F77203D3D3D2077696E646F772E746F7029207B0A20202020202072657475726E3B0A202020207D0A202020207661722063737353656C6563746F';
wwv_flow_imp.g_varchar2_table(93) := '72203D20276C696E6B5B72656C3D227374796C657368656574225D5B687265662A3D226A746C5F6974656D225D273B0A0A202020202F2F20436865636B2069662066696C652065786973747320696E20746F702077696E646F770A202020206966202875';
wwv_flow_imp.g_varchar2_table(94) := '69772E5F746F70417065782E6A51756572792863737353656C6563746F72292E6C656E677468203D3D3D203029207B0A2020202020207569772E5F746F70417065782E6A517565727928276865616427292E617070656E6428242863737353656C656374';
wwv_flow_imp.g_varchar2_table(95) := '6F72292E636C6F6E652829293B0A202020207D0A20207D2C0A0A0A20205F696E6974456C656D656E74733A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20202020207569772E5F656C656D656E74732E2477';
wwv_flow_imp.g_varchar2_table(96) := '696E646F77203D207569772E5F746F70417065782E6A51756572792877696E646F77293B0A20202020207569772E5F656C656D656E74732E24646F63756D656E74203D207569772E5F746F70417065782E6A51756572792877696E646F772E746F702E64';
wwv_flow_imp.g_varchar2_table(97) := '6F63756D656E74293B0A20202020207569772E5F656C656D656E74732E24626F6479203D207569772E5F746F70417065782E6A51756572792877696E646F772E746F702E646F63756D656E742E626F6479293B0A0A20207D2C0A0A0A20205F696E697444';
wwv_flow_imp.g_varchar2_table(98) := '69616C6F67456C656D656E74733A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E74203D207569772E5F746F70417065782E6A';
wwv_flow_imp.g_varchar2_table(99) := '517565727928276469762E6A746C6974656D2D636F6E74656E7427293B0A20202020207569772E5F656C656D656E74732E2473617665427574746F6E203D207569772E5F746F70417065782E6A51756572792827627574746F6E2E6A746C6974656D2D73';
wwv_flow_imp.g_varchar2_table(100) := '6176652D627574746F6E27293B0A20202020207569772E5F656C656D656E74732E2463616E63656C427574746F6E203D207569772E5F746F70417065782E6A51756572792827627574746F6E2E6A746C6974656D2D63616E63656C2D627574746F6E2729';
wwv_flow_imp.g_varchar2_table(101) := '3B0A0A20207D2C0A0A0A20205F696E697442617365456C656D656E74733A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20202020207569772E6C6F672820225F696E697442617365456C656D656E74732229';
wwv_flow_imp.g_varchar2_table(102) := '3B0A20202020207569772E656C6F67282022656C656D656E74222C207569772E656C656D656E74293B0A0A20202020207569772E5F76616C7565732E6669656C6453697A65203D207569772E6F7074696F6E732E6974656D54797065203D3D3D20225445';
wwv_flow_imp.g_varchar2_table(103) := '5854223F207569772E5F6974656D242E61747472282273697A652229203A207569772E5F6974656D242E617474722822636F6C7322293B0A2020202020696620287569772E6F7074696F6E732E6974656D54797065203D3D3D2022544558544152454122';
wwv_flow_imp.g_varchar2_table(104) := '29207B0A202020202020207569772E5F76616C7565732E6669656C64526F7773203D207569772E5F6974656D242E617474722822726F777322293B0A20202020207D0A20202020207569772E5F76616C7565732E6669656C644D61784C656E677468203D';
wwv_flow_imp.g_varchar2_table(105) := '207569772E5F6974656D242E6174747228226D61786C656E67746822293B0A0A20202020202F2F205374617274696E67207769746820415045582031382E3120746865206974656D2073657420697320746865206974656D5772617070657220636C6173';
wwv_flow_imp.g_varchar2_table(106) := '730A20202020207569772E5F656C656D656E74732E246974656D736574203D207569772E5F6974656D242E706172656E7428293B0A20202020207569772E5F656C656D656E74732E246D6C73427574746F6E203D207569772E5F656C656D656E74732E24';
wwv_flow_imp.g_varchar2_table(107) := '6974656D7365742E66696E642827627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E27293B0A20207D2C0A0A0A20202F2F205F73796E634C616E67756167654D617020696E69746973207468652062617365206461746120666F72205F6765';
wwv_flow_imp.g_varchar2_table(108) := '74544C0A20202F2F20497420637265617465732061206D6170206F66206C616E677561676520636F64657320616E642074686569722076616C75657320666F722066617374206163636573730A20205F73796E634C616E67756167654D61703A2066756E';
wwv_flow_imp.g_varchar2_table(109) := '6374696F6E2829207B0A202020202076617220756977203D20746869732C0A20202020202020202069203D206E756C6C2C0A20202020202020202074616773203D207B7D3B0A0A20202020207569772E6C6F672820225F73796E634C616E67756167654D';
wwv_flow_imp.g_varchar2_table(110) := '617022293B0A202020202074616773203D207569772E5F76616C7565732E646174614A534F4E3B0A0A20202020202F2F20687474703A2F2F6D617474736E696465722E636F6D2F686F772D746F2D656666696369656E746C792D7365617263682D612D6A';
wwv_flow_imp.g_varchar2_table(111) := '736F6E2D61727261792F0A20202020207569772E5F76616C7565732E7461674D6170203D207B7D3B0A2020202020666F72202869203D20303B20746167732E6C656E677468203E20693B2069202B3D203129207B0A2020202020202020207569772E5F76';
wwv_flow_imp.g_varchar2_table(112) := '616C7565732E7461674D61705B746167735B695D2E6C5D203D20746167735B695D2E746C3B0A2020202020202020202F2F20636F6E736F6C652E6C6F6728692C20225B22202B20746167735B695D2E6C202B20225D203D20222C20746167735B695D2E74';
wwv_flow_imp.g_varchar2_table(113) := '6C290A20202020207D0A2020202020200A20207D2C0A0A0A20202F2F2067657420746865206C616E67756167652076616C756520666F72206120676976656E206C616E677561676520636F64650A20205F676574544C3A2066756E6374696F6E286C616E';
wwv_flow_imp.g_varchar2_table(114) := '67436F646529207B0A202020202076617220756977203D20746869733B0A202020202072657475726E207569772E5F76616C7565732E7461674D61705B6C616E67436F64655D3B0A20207D2C0A0A0A20202F2F206765742074686520696E64657820706F';
wwv_flow_imp.g_varchar2_table(115) := '736974696F6E206F662061206C616E677561676520636F646520696E2074686520646174614A534F4E2C206F72202D312069662069742773206E6F742074686572650A20205F6765744C616E6775616765496E6465783A2066756E6374696F6E286C616E';
wwv_flow_imp.g_varchar2_table(116) := '67436F646529207B0A202020202076617220756977203D20746869732C0A2020202020202020206A203D207569772E5F76616C7565732E646174614A534F4E2C0A20202020202020202069203D206E756C6C2C0A202020202020202020696478203D202D';
wwv_flow_imp.g_varchar2_table(117) := '313B0A0A2020202020666F72202869203D20303B206A2E6C656E677468203E206920262620696478203D3D202D313B2069202B3D203129207B0A20202020202020696620286A5B695D2E6C203D3D3D206C616E67436F646529207B0A2020202020202020';
wwv_flow_imp.g_varchar2_table(118) := '20696478203D20693B0A202020202020207D0A20202020207D0A202020202072657475726E206964783B0A20207D2C0A0A0A0A20202F2F20657870656374732061206A746C4A534F4E20737472756374757265206F7220616E20656D707479206F626A65';
wwv_flow_imp.g_varchar2_table(119) := '63740A20205F696E6974446174614A534F4E3A2066756E6374696F6E286A746C4A534F4E297B0A202020202076617220756977203D20746869732C0A2020202020202020206A736F6E44617461203D205B5D2C0A202020202020202020696E7075745F64';
wwv_flow_imp.g_varchar2_table(120) := '617461203D206A746C4A534F4E207C7C207B7D3B0A0A2020202020202020207569772E6C6F6728225F696E6974446174614A534F4E22293B0A2020202020202020207569772E656C6F67287B696E7075745F646174617D293B0A0A202020202069662028';
wwv_flow_imp.g_varchar2_table(121) := '617065782E6A51756572792E6973456D7074794F626A65637428696E7075745F646174612929207B0A20202020202020207569772E6C6F672822496E697469616C697A696E67207769746820656D7074792076616C756522293B0A0A2020202020202020';
wwv_flow_imp.g_varchar2_table(122) := '2F2F20546865207265636F726420697320656D70747920736F207765206275696C642061200A20202020202020202F2F206275696C64204A534F4E207769746820746869732073747275637475726520746F20736565642069743A0A2020202020202020';
wwv_flow_imp.g_varchar2_table(123) := '2F2F20205B207B226C223A20227573222C2022746C223A202250726F6A65637420416E616C79736973227D0A20202020202020202F2F20202C207B226C223A20226672222C2022746C223A2022416E616C7973652064652070726F6A6574227D0A202020';
wwv_flow_imp.g_varchar2_table(124) := '20202020202F2F20202C207B226C223A20226573222C2022746C223A2022416E616C697369732064652070726F6A6563746F227D5D0A20202020202020207569772E5F76616C7565732E6C616E6775616765732E666F72456163682866756E6374696F6E';
wwv_flow_imp.g_varchar2_table(125) := '286C29207B0A20202020202020202020206A736F6E446174612E70757368287B226C223A206C2C2022746C223A2022227D293B0A20202020202020207D293B0A0A20202020202020207569772E5F76616C7565732E646174614A534F4E203D206A736F6E';
wwv_flow_imp.g_varchar2_table(126) := '446174613B0A20202020202020207569772E5F76616C7565732E6E65775265636F7264203D20747275653B0A20202020207D0A2020202020656C7365207B0A202020202020207569772E5F76616C7565732E646174614A534F4E203D20696E7075745F64';
wwv_flow_imp.g_varchar2_table(127) := '6174613B0A202020202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B0A20202020207D0A0A20202020207569772E5F73796E634C616E67756167654D617028293B0A0A20207D2C0A0A0A20202F2F204D61696E746169';
wwv_flow_imp.g_varchar2_table(128) := '6E7320746865204A544C204A534F4E206461746120696E2073796E632E0A20202F2F206966206372656174696E672061206E6577207265636F72642C20616C6C2074686520656E74657265642076616C75657320617265207573656420666F7220414C4C';
wwv_flow_imp.g_varchar2_table(129) := '20746865206C616E6775616765730A20202F2F206F74686572776973652074686520656E74657265642076616C756520676F657320696E746F2074686520637572725F6C616E675F696E646578206F6E6C790A20205F73796E634A534F4E646174613A20';
wwv_flow_imp.g_varchar2_table(130) := '66756E6374696F6E286576656E744F626A29207B0A20202020202F2F2076617220756977203D206576656E744F626A2E646174612E7569772C0A2020202020766172207569773B0A0A202020202069662028747970656F66206576656E744F626A20213D';
wwv_flow_imp.g_varchar2_table(131) := '2022756E646566696E65642229207B0A20202020202020202F2F20776520776572652063616C6C2066726F6D20616E206576656E740A2020202020202020756977203D206576656E744F626A2E646174612E7569773B0A20202020207D0A202020202065';
wwv_flow_imp.g_varchar2_table(132) := '6C7365207B0A20202020202020202F2F206469726563742063616C6C0A2020202020202020756977203D20746869733B0A20202020207D0A20202020207569772E6C6F6728225F73796E634A534F4E6461746122293B0A0A202020202069662028756977';
wwv_flow_imp.g_varchar2_table(133) := '2E5F76616C7565732E6E65775265636F726429207B0A20202020202020202F2F204F6E206E6577207265636F72642077652077616E7420746F207361766520746865206E657720656E74657265642076616C756520696E746F2074686520414C4C207468';
wwv_flow_imp.g_varchar2_table(134) := '650A20202020202020202F2F207265636F72647320696E20746865204A534F4E207374727563747572650A2020202020202020666F7220287661722069203D207569772E5F76616C7565732E746F74616C4C616E677561676573202D20313B2069203E3D';
wwv_flow_imp.g_varchar2_table(135) := '20303B20692D2D29207B0A202020202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E746C203D207569772E5F6974656D242E76616C28293B0A20202020202020207D0A20202020207D0A2020202020656C7365206966202875';
wwv_flow_imp.g_varchar2_table(136) := '69772E5F76616C7565732E637572725F6C616E675F696E646578203E3D203029207B0A20202020202020202F2F207361766520746865206E6577207465787420696E746F20746865204A534F4E2073747275637475726520666F72207468652063757272';
wwv_flow_imp.g_varchar2_table(137) := '656E74206C616E67756167650A20202020202020207569772E5F76616C7565732E646174614A534F4E5B7569772E5F76616C7565732E637572725F6C616E675F696E6465785D2E746C203D207569772E5F6974656D242E76616C28293B0A20202020207D';
wwv_flow_imp.g_varchar2_table(138) := '0A2020202020656C736520696620287569772E5F6974656D242E76616C282920213D3D20222229207B0A20202020202020202F2F20546865204A534F4E20686173206E6F20656E74727920666F72207468652063757272656E74206C616E67756167652E';
wwv_flow_imp.g_varchar2_table(139) := '20416464206F6E6520736F2074686520746578742069730A20202020202020202F2F2073617665642C206974206D757374206E6576657220656E6420757020696E20616E6F74686572206C616E67756167652E0A20202020202020207569772E5F76616C';
wwv_flow_imp.g_varchar2_table(140) := '7565732E646174614A534F4E2E70757368287B226C223A207569772E6F7074696F6E732E6C616E672C2022746C223A207569772E5F6974656D242E76616C28297D293B0A20202020202020207569772E5F76616C7565732E637572725F6C616E675F696E';
wwv_flow_imp.g_varchar2_table(141) := '646578203D207569772E5F76616C7565732E646174614A534F4E2E6C656E677468202D20313B0A20202020207D0A0A20202020207569772E5F73796E634C616E67756167654D617028293B0A20207D2C0A0A0A0A20205F696E69744469616C6F67427574';
wwv_flow_imp.g_varchar2_table(142) := '746F6E733A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20202020207569772E5F656C656D656E74732E2463616E63656C427574746F6E0A20202020202020202E62696E642827636C69636B272C207B7569';
wwv_flow_imp.g_varchar2_table(143) := '773A207569777D2C207569772E5F68616E646C6543616E63656C427574746F6E436C69636B293B0A0A20202020207569772E5F656C656D656E74732E2473617665427574746F6E0A20202020202020202E62696E642827636C69636B272C207B7569773A';
wwv_flow_imp.g_varchar2_table(144) := '207569777D2C207569772E5F68616E646C6553617665427574746F6E436C69636B293B0A0A20207D2C0A0A0A0A20205F68616E646C6543616E63656C427574746F6E436C69636B3A2066756E6374696F6E286576656E744F626A29207B0A202020202076';
wwv_flow_imp.g_varchar2_table(145) := '617220756977203D206576656E744F626A2E646174612E7569773B0A0A20202020202F2F20696620746865206469616C6F67206F70656E732C207765277265206E6F742061206E6577207265636F726420616E79206D6F72650A20202020207569772E5F';
wwv_flow_imp.g_varchar2_table(146) := '76616C7565732E6E65775265636F7264203D2066616C73653B0A0A20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B202F2F20746869732073686F756C64206361736361646520746F2072656D';
wwv_flow_imp.g_varchar2_table(147) := '6F766520746865206469616C6F670A0A20207D2C0A0A0A0A20205F68616E646C6553617665427574746F6E436C69636B3A2066756E6374696F6E286576656E744F626A29207B0A202020202076617220756977203D206576656E744F626A2E646174612E';
wwv_flow_imp.g_varchar2_table(148) := '7569772C0A202020202020202020646973706C61795F76616C75653B0A0A20202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E6428272E6A746C6974656D2D76616C756527292E656163682866756E6374696F6E';
wwv_flow_imp.g_varchar2_table(149) := '28692C656C297B0A20202020202020202F2F206C6F6F70207468726F75676820616C6C206469616C6F6720656C656D656E747320616E642073746F7265207472616E736C6174696F6E730A20202020202020202F2F206261636B20696E746F2074686520';
wwv_flow_imp.g_varchar2_table(150) := '646174614A534F4E207374727563747572652E0A20202020202020202F2F2046696E642065616368206C616E67756167652062792069747320636F64653A20746865204A534F4E206D6179206F7264657220697473206C616E6775616765730A20202020';
wwv_flow_imp.g_varchar2_table(151) := '202020202F2F20646966666572656E746C79207468616E2074686520636F6E66696775726174696F6E2C206C6561766520736F6D65206F7574206F722068617665206D6F72652E0A202020202020202076617220696478203D207569772E5F6765744C61';
wwv_flow_imp.g_varchar2_table(152) := '6E6775616765496E64657828656C2E646174617365742E6C616E67293B0A0A20202020202020202F2F207569772E6C6F672869202B20222822202B20656C2E646174617365742E6C616E67202B2022293A22202B20656C2E76616C7565293B0A0A202020';
wwv_flow_imp.g_varchar2_table(153) := '202020202069662028696478203E3D203029207B0A20202020202020202020207569772E5F76616C7565732E646174614A534F4E5B6964785D2E746C203D20656C2E76616C75653B0A20202020202020207D0A2020202020202020656C73652069662028';
wwv_flow_imp.g_varchar2_table(154) := '656C2E76616C756520213D3D20222229207B0A20202020202020202020202F2F206E6F20656E74727920666F722074686973206C616E6775616765207965742C20616464206F6E6520736F2074686520746578742069732073617665640A202020202020';
wwv_flow_imp.g_varchar2_table(155) := '20202020207569772E5F76616C7565732E646174614A534F4E2E70757368287B226C223A20656C2E646174617365742E6C616E672C2022746C223A20656C2E76616C75657D293B0A20202020202020207D0A0A20202020207D293B0A0A20202020207569';
wwv_flow_imp.g_varchar2_table(156) := '772E5F73796E634C616E67756167654D617028293B0A0A20202020202F2F20776527726520646F6E652022736176696E6722206261636B2066726F6D20746865206469616C6F672C20636C65617220746865206E65775265636F726420666C61670A2020';
wwv_flow_imp.g_varchar2_table(157) := '2020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B0A0A20202020202F2F2074686520706F736974696F6E73206F6620746865206C616E677561676573206D61792068617665206368616E6765642C2066696E64206F7572';
wwv_flow_imp.g_varchar2_table(158) := '7320616761696E0A20202020207569772E5F76616C7565732E637572725F6C616E675F696E646578203D207569772E5F6765744C616E6775616765496E646578287569772E6F7074696F6E732E6C616E67293B0A0A2020202020646973706C61795F7661';
wwv_flow_imp.g_varchar2_table(159) := '6C7565203D207569772E5F676574544C287569772E6F7074696F6E732E6C616E67293B0A202020202069662028646973706C61795F76616C756520213D3D20756E646566696E656420262620646973706C61795F76616C756520213D3D206E756C6C2920';
wwv_flow_imp.g_varchar2_table(160) := '7B0A20202020202020207569772E5F6974656D242E76616C28646973706C61795F76616C7565293B0A20202020207D0A20202020207569772E5F7369676E616C4368616E676528293B0A0A20202020207569772E5F656C656D656E74732E246469616C6F';
wwv_flow_imp.g_varchar2_table(161) := '672E6469616C6F672827636C6F736527293B202F2F20746869732073686F756C64206361736361646520746F2072656D6F766520746865206469616C6F670A20207D2C0A0A0A20205F7369676E616C4368616E67653A2066756E6374696F6E2829207B0A';
wwv_flow_imp.g_varchar2_table(162) := '202020202076617220756977203D20746869733B0A0A20202020202F2F204E65656420746F2075736520617065782E6A517565727920666F7220746865206576656E747320746F207265676973746572207769746820746865204441206672616D65776F';
wwv_flow_imp.g_varchar2_table(163) := '726B0A2020202020617065782E6A5175657279287569772E5F6974656D245B305D292E7472696767657228276368616E676527293B0A20207D2C0A0A0A20205F68616E646C654F70656E436C69636B3A2066756E6374696F6E286576656E744F626A2920';
wwv_flow_imp.g_varchar2_table(164) := '7B0A202020202076617220756977203D206576656E744F626A2E646174612E7569773B0A0A20202020207569772E6C6F6728225F68616E646C654F70656E436C69636B22293B0A0A20202020207569772E5F73796E634A534F4E64617461286576656E74';
wwv_flow_imp.g_varchar2_table(165) := '4F626A293B0A20202020207569772E5F73686F774469616C6F6728293B0A20207D2C0A0A0A20205F73686F774469616C6F673A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869732C0A2020202020202020204449414C4F';
wwv_flow_imp.g_varchar2_table(166) := '475F434C415353203D202775692D6469616C6F67272C20202F2F2077652070726566657220697420746F202775692D6469616C6F672D2D617065782720746F2061766F69642072652D63656E746572696E670A2020202020202020206C616E675461626C';
wwv_flow_imp.g_varchar2_table(167) := '652C0A2020202020202020206469616C6F67506F736974696F6E2C0A2020202020202020206469616C6F6748746D6C3B0A0A20202020207569772E6C6F6728225F73686F774469616C6F6722293B0A0A0A2020202020696620287569772E5F76616C7565';
wwv_flow_imp.g_varchar2_table(168) := '732E636F6E74726F6C6C65724D6F6465207C7C2021617065782E6A51756572792E6973456D7074794F626A656374287569772E5F656C656D656E74732E24677269642929207B0A20202020202020207569772E6C6F6728277765206469646E5C27742067';
wwv_flow_imp.g_varchar2_table(169) := '6574206120686F6C64206F662074686520677269642C206D617962652074727920616761696E27293B0A20202020202020207569772E5F696E697447726964436F6E66696728293B0A20202020207D0A0A20202020206C616E675461626C65203D200A20';
wwv_flow_imp.g_varchar2_table(170) := '20202020202020202020273C7461626C6520636C6173733D22742D5265706F72742D7265706F7274222073756D6D6172793D22417661696C61626C65205472616E736C6174696F6E73223E5C6E27202B0A202020202020202020202027203C74723E5C6E';
wwv_flow_imp.g_varchar2_table(171) := '27202B0A20202020202020202020202720203C746820636C6173733D22742D5265706F72742D636F6C48656164223E27202B207569772E5F76616C7565732E6D657373616765732E6C616E67756167654C6162656C202B20273C2F74683E27202B0A2020';
wwv_flow_imp.g_varchar2_table(172) := '2020202020202020202720203C746820636C6173733D22742D5265706F72742D636F6C4865616420752D744C223E27202B207569772E5F76616C7565732E6D657373616765732E6C616E677561676556616C7565202B20273C2F74683E27202B0A202020';
wwv_flow_imp.g_varchar2_table(173) := '202020202020202027203C2F74723E5C6E273B0A20202020202020202020202F2F2027203C74723E5C6E273B0A0A2020202020242E65616368287569772E5F76616C7565732E6C616E6775616765732C2066756E6374696F6E2820696E6465782C206C61';
wwv_flow_imp.g_varchar2_table(174) := '6E672029207B0A202020202020202F2F20746865207472616E736C6174696F6E206F662074686973206C616E67756167652C20746865204A534F4E206D6179206E6F742068617665206F6E650A20202020202020766172207472616E736C6174696F6E20';
wwv_flow_imp.g_varchar2_table(175) := '3D207569772E5F676574544C286C616E67293B0A20202020202020696620287472616E736C6174696F6E203D3D3D20756E646566696E6564207C7C207472616E736C6174696F6E203D3D3D206E756C6C29207B0A2020202020202020207472616E736C61';
wwv_flow_imp.g_varchar2_table(176) := '74696F6E203D2022223B0A202020202020207D0A0A202020202020206C616E675461626C65202B3D0A2020202020202027203C747227202B20286C616E67203D3D3D207569772E6F7074696F6E732E6C616E673F202720636C6173733D2273656C656374';
wwv_flow_imp.g_varchar2_table(177) := '656422273A272729202B20273E5C6E27202B0A202020202020202720203C746420636C6173733D22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D7443223E27202B20617065782E7574696C2E65736361';
wwv_flow_imp.g_varchar2_table(178) := '706548544D4C41747472286C616E6729202B20273C2F74643E27202B0A202020202020202720203C746420636C6173733D22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D744C223E273B0A2020202020';
wwv_flow_imp.g_varchar2_table(179) := '2020696620287569772E6F7074696F6E732E6974656D54797065203D3D3D2022544558542229207B0A2020202020202020206C616E675461626C65202B3D0A20202020202020202027202020203C696E70757420747970653D22746578742220636C6173';
wwv_flow_imp.g_varchar2_table(180) := '733D22746578745F6669656C6420617065782D6974656D2D74657874206A746C6974656D2D76616C75652220646174612D6C616E673D2227202B206C616E67202B2027222076616C75653D2227202B20617065782E7574696C2E65736361706548544D4C';
wwv_flow_imp.g_varchar2_table(181) := '41747472287472616E736C6174696F6E29202B2027222073697A653D2227202B207569772E5F76616C7565732E6669656C6453697A65202B202722206D61786C656E6774683D2227202B207569772E5F76616C7565732E6669656C644D61784C656E6774';
wwv_flow_imp.g_varchar2_table(182) := '68202B2027223E3C2F74643E273B0A202020202020207D0A20202020202020656C7365207B0A2020202020202020206C616E675461626C65202B3D0A20202020202020202027202020203C746578746172656120636C6173733D22746578746172656120';
wwv_flow_imp.g_varchar2_table(183) := '617065782D6974656D2D7465787461726561206A746C6974656D2D76616C75652220646174612D6C616E673D2227202B206C616E67202B20272227202B0A20202020202020202020202020202720636F6C733D2227202B207569772E5F76616C7565732E';
wwv_flow_imp.g_varchar2_table(184) := '6669656C6453697A65202B20272220726F77733D2227202B207569772E5F76616C7565732E6669656C64526F7773202B20272227202B200A202020202020202020202020202027206D61786C656E6774683D2227202B207569772E5F76616C7565732E66';
wwv_flow_imp.g_varchar2_table(185) := '69656C644D61784C656E677468202B20272227202B200A2020202020202020202020202020273E27202B20617065782E7574696C2E65736361706548544D4C41747472287472616E736C6174696F6E29202B20273C2F74657874617265613E273B0A2020';
wwv_flow_imp.g_varchar2_table(186) := '20202020207D0A0A202020202020206C616E675461626C65202B3D0A202020202020202027203C2F74723E5C6E273B0A20202020207D293B0A20202020206C616E675461626C65202B3D0A2020202020273C2F7461626C653E5C6E273B0A0A2020202020';
wwv_flow_imp.g_varchar2_table(187) := '206469616C6F6748746D6C203D0A2020202020202020202020273C64697620636C6173733D2227202B207569772E5F76616C7565732E706F707570436C617373202B2027223E3C64697620636C6173733D226A746C6974656D2D636F6E7461696E657220';
wwv_flow_imp.g_varchar2_table(188) := '75692D776964676574223E5C6E27202B0A20202020202020202020202720203C64697620636C6173733D226A746C6974656D2D627574746F6E2D636F6E7461696E6572223E5C6E27202B0A20202020202020202020202720202020203C627574746F6E20';
wwv_flow_imp.g_varchar2_table(189) := '636C6173733D226A746C6974656D2D63616E63656C2D627574746F6E20742D427574746F6E223E27202B0A202020202020202020202027202020202020203C7370616E20636C6173733D22742D427574746F6E2D6C6162656C223E27202B207569772E5F';
wwv_flow_imp.g_varchar2_table(190) := '76616C7565732E6D657373616765732E63616E63656C427574746F6E202B20273C2F7370616E3E27202B0A20202020202020202020202F2F2027202020202020203C7370616E20636C6173733D2275692D69636F6E2075692D69636F6E2D636C6F736522';
wwv_flow_imp.g_varchar2_table(191) := '3E3C2F7370616E3E27202B200A20202020202020202020202720202020203C2F627574746F6E3E5C6E27202B0A20202020202020202020202720202020203C627574746F6E20636C6173733D226A746C6974656D2D736176652D627574746F6E20742D42';
wwv_flow_imp.g_varchar2_table(192) := '7574746F6E20742D427574746F6E2D2D686F74223E27202B200A202020202020202020202027202020202020203C7370616E20636C6173733D22742D427574746F6E2D6C6162656C223E27202B207569772E5F76616C7565732E6D657373616765732E61';
wwv_flow_imp.g_varchar2_table(193) := '70706C794368616E676573202B20273C2F7370616E3E27202B0A202020202020202020202027202020202020203C7370616E20636C6173733D22742D49636F6E20742D49636F6E2D2D72696768742066612066612D636865636B223E3C2F7370616E3E27';
wwv_flow_imp.g_varchar2_table(194) := '202B200A20202020202020202020202720202020203C2F627574746F6E3E5C6E27202B0A20202020202020202020202720203C2F6469763E5C6E27202B0A20202020202020202020202720203C64697620636C6173733D226A746C6974656D2D636F6E74';
wwv_flow_imp.g_varchar2_table(195) := '656E74223E5C6E27202B0A20202020202020202020202020206C616E675461626C65202B0A20202020202020202020202720203C2F6469763E5C6E27202B0A2020202020202020202020273C2F6469763E3C2F6469763E5C6E273B0A0A20202020207569';
wwv_flow_imp.g_varchar2_table(196) := '772E5F656C656D656E74732E24626F64792E617070656E64286469616C6F6748746D6C293B0A0A20202020202F2F2072656164792061206469616C6F6720636F6E7461696E6572206279206372656174696E672061206469760A20202020202F2F207569';
wwv_flow_imp.g_varchar2_table(197) := '772E5F656C656D656E74732E246469616C6F67203D202428706F70757053454C293B0A20202020207569772E5F656C656D656E74732E246469616C6F67203D207569772E5F746F70417065782E6A5175657279287569772E5F76616C7565732E706F7075';
wwv_flow_imp.g_varchar2_table(198) := '7053454C293B0A0A20202020202F2F206469616C6F67506F736974696F6E203D207569772E5F6974656D242E6F666673657428293B20202F2F20706F736974696F6E206E65787420746F20746865206974656D0A20202020206966202877696E646F7720';
wwv_flow_imp.g_varchar2_table(199) := '3D3D3D2077696E646F772E746F7029207B0A20202020202020206469616C6F67506F736974696F6E203D207B206D793A20226C656674222C2061743A20226C6566742063656E746572222C206F663A207569772E5F6974656D245B305D207D3B20202F2F';
wwv_flow_imp.g_varchar2_table(200) := '20706F736974696F6E206E65787420746F20746865206974656D0A20202020207D0A2020202020656C7365207B0A20202020202020202F2F20706F736974696F6E206261736564206F6E20746865206469616C6F67202863656E746572656421290A2020';
wwv_flow_imp.g_varchar2_table(201) := '2020202020206469616C6F67506F736974696F6E203D207B206D793A202263656E7465722063656E746572222C2061743A202263656E7465722063656E746572222C206F663A207569772E5F746F70417065782E6A517565727928272E272B4449414C4F';
wwv_flow_imp.g_varchar2_table(202) := '475F434C415353295B305D207D3B0A20202020207D0A0A20202020202F2F206F70656E2063726561746564206469762061732061206469616C6F670A20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F67287B0A20202020';
wwv_flow_imp.g_varchar2_table(203) := '2020202020636C6F73654F6E4573636170653A20747275652C0A2020202020202020207469746C653A2020202020202020207569772E6F7074696F6E732E6469616C6F675469746C652C0A2020202020202020206175746F526573697A653A2020202074';
wwv_flow_imp.g_varchar2_table(204) := '7275652C0A2020202020202020206D696E57696474683A2020202020203430302C0A2020202020202020206D696E4865696768743A20202020203235302C0A20202020202020202077696474683A202020202020202020276175746F272C0A2020202020';
wwv_flow_imp.g_varchar2_table(205) := '202020206865696768743A2020202020202020276175746F272C0A2020202020202020206D6F64616C3A202020202020202020747275652C0A2020202020202020206469616C6F67436C6173733A2020204449414C4F475F434C4153532C0A2020202020';
wwv_flow_imp.g_varchar2_table(206) := '20202020706F736974696F6E3A2020202020206469616C6F67506F736974696F6E2C0A2020202020202020206F70656E3A2066756E6374696F6E2829207B0A2020202020202020202020202F2F207569772E5F746F70417065782E6E617669676174696F';
wwv_flow_imp.g_varchar2_table(207) := '6E2E626567696E467265657A655363726F6C6C28293B0A2020202020202020202020207569772E5F696E69744469616C6F67456C656D656E747328293B0A2020202020202020202020207569772E5F696E69744469616C6F67427574746F6E7328293B0A';
wwv_flow_imp.g_varchar2_table(208) := '0A2020202020202020202020202F2F20466F637573206F6E207468652066697273742076616C7565206F66207468652063757272656E74206C616E6775616765200A2020202020202020202020207569772E5F656C656D656E74732E246469616C6F6743';
wwv_flow_imp.g_varchar2_table(209) := '6F6E74656E742E66696E64282774722E73656C6563746564202E6A746C6974656D2D76616C756527292E747269676765722827666F63757327293B0A2020202020202020207D2C0A202020202020202020636C6F73653A2066756E6374696F6E2829207B';
wwv_flow_imp.g_varchar2_table(210) := '0A0A2020202020202020202020202F2F20242874686973292E6469616C6F67282764657374726F7927293B0A2020202020202020202020207569772E5F656C656D656E74732E246469616C6F672E72656D6F766528293B0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(211) := '7569772E5F656C656D656E74732E24646F63756D656E742E66696E64287569772E5F76616C7565732E706F70757053454C292E72656D6F766528293B0A2020202020202020202020202F2F207569772E5F746F70417065782E6E617669676174696F6E2E';
wwv_flow_imp.g_varchar2_table(212) := '656E64467265657A655363726F6C6C28293B0A0A2020202020202020202020207569772E5F7265736574466F63757328293B0A2020202020202020207D0A202020202020207D290A202020202020202E6F6E28276B6579646F776E272C2066756E637469';
wwv_flow_imp.g_varchar2_table(213) := '6F6E2865767429207B0A2020202020202020202020696620286576742E6B6579436F6465203D3D3D20242E75692E6B6579436F64652E45534341504529207B0A2020202020202020202020202020207569772E5F656C656D656E74732E246469616C6F67';
wwv_flow_imp.g_varchar2_table(214) := '2E6469616C6F672827636C6F736527293B0A20202020202020202020207D202020202020202020202020202020200A20202020202020202020206576742E73746F7050726F7061676174696F6E28293B0A202020202020207D293B0A0A0A20207D2C0A0A';
wwv_flow_imp.g_varchar2_table(215) := '0A202064697361626C653A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A2020202020696620287569772E5F76616C7565732E64697361626C6564203D3D3D2066616C736529207B0A20202020202020207569';
wwv_flow_imp.g_varchar2_table(216) := '772E5F6974656D240A20202020202020202020202E61747472282764697361626C6564272C2764697361626C656427293B0A0A20202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E0A20202020202020202020202E61747472';
wwv_flow_imp.g_varchar2_table(217) := '282764697361626C6564272C2764697361626C656427290A20202020202020202020202E756E62696E642827636C69636B272C207569772E5F68616E646C654F70656E436C69636B293B0A20202020207D0A0A20202020207569772E5F76616C7565732E';
wwv_flow_imp.g_varchar2_table(218) := '64697361626C6564203D20747275653B0A20207D2C0A0A0A2020656E61626C653A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A2020202020696620287569772E5F76616C7565732E64697361626C6564203D';
wwv_flow_imp.g_varchar2_table(219) := '3D3D207472756529207B0A202020202020207569772E5F6974656D242E72656D6F766541747472282764697361626C656427293B0A202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E0A202020202020202020202E72656D6F';
wwv_flow_imp.g_varchar2_table(220) := '766541747472282764697361626C656427290A202020202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69636B293B0A0A202020202020207569772E5F76616C7565732E64';
wwv_flow_imp.g_varchar2_table(221) := '697361626C6564203D2066616C73653B0A20202020207D0A20207D0A7D293B0A0A2F2F2320736F757263654D617070696E6755524C3D6A746C5F6974656D2E6A732E6D61700A';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(15543679943005948)
,p_plugin_id=>wwv_flow_imp.id(1036953622393257522)
,p_file_name=>'js/jtl_item.js'
,p_mime_type=>'application/x-javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '7B2276657273696F6E223A332C226E616D6573223A5B5D2C226D617070696E6773223A22222C22736F7572636573223A5B226A746C5F6974656D2E6A73225D2C22736F7572636573436F6E74656E74223A5B222F2A5C6E202A204A544C204974656D2076';
wwv_flow_imp.g_varchar2_table(2) := '312E332E30202D20687474703A2F2F617065782E776F726C642F706C7567696E732F5C6E202A5C6E202A204C6963656E73656420756E646572204D4954204C6963656E736520284D4954295C6E202A204A6F7267652052696D626C617320C2A920323031';
wwv_flow_imp.g_varchar2_table(3) := '372D323032305C6E2A2F5C6E5C6E242E77696467657428205C2275692E6A746C4974656D5C222C207B5C6E205C6E20202F2F2044656661756C74206F7074696F6E732E5C6E20206F7074696F6E733A207B5C6E20202020206C616E673A205C22656E5C22';
wwv_flow_imp.g_varchar2_table(4) := '2C5C6E20202020206C616E675F636F6465733A205B5D2C20202F2F205B5C22656E5C222C5C2266725C222C5C2265735C225D5C6E20202020206D657373616765733A206E756C6C2C5C6E20202020206974656D4E616D653A2027272C5C6E202020202066';
wwv_flow_imp.g_varchar2_table(5) := '69656C6453697A653A2033302C5C6E20202020206669656C64526F77733A20352C5C6E20202020206669656C644D61784C656E6774683A2038302C5C6E20202020206469616C6F675469746C653A206E756C6C5C6E20207D2C5C6E5C6E20202F2F204C6F';
wwv_flow_imp.g_varchar2_table(6) := '6767696E6720666F72205C22726567756C61725C22207465787420656C656D656E74735C6E20206C6F673A2066756E6374696F6E2829207B5C6E202020207661722061726773203D2041727261792E70726F746F747970652E6A6F696E2E63616C6C2820';
wwv_flow_imp.g_varchar2_table(7) := '617267756D656E74732C20272C202720293B5C6E20202020617065782E64656275672E6D65737361676528342C205C226A746C6974656D3A5C222C2061726773293B5C6E20207D2C5C6E20202F2F20456E68616E636564206C6F675C6E20202F2F206163';
wwv_flow_imp.g_varchar2_table(8) := '63657074732032206F626A6563747320666F72206C6F6767696E675C6E2020656C6F673A2066756E6374696F6E2870312C703229207B5C6E20202020617065782E64656275672E6D65737361676528342C205C226A746C6974656D3A5C222C2070312C20';
wwv_flow_imp.g_varchar2_table(9) := '7032293B5C6E20207D2C5C6E5C6E20205F746F70417065783A20617065782E7574696C2E676574546F704170657828292C5C6E5C6E5C6E20205F6372656174655072697661746553746F726167653A2066756E6374696F6E2829207B5C6E202020202076';
wwv_flow_imp.g_varchar2_table(10) := '617220756977203D20746869732C5C6E2020202020202020204449414C4F475F504F5055505F434C415353203D20276A746C6974656D2D6469616C6F67273B5C6E5C6E20202020207569772E5F6974656D24203D202428272327202B207569772E6F7074';
wwv_flow_imp.g_varchar2_table(11) := '696F6E732E6974656D4E616D65293B5C6E5C6E20202020207569772E5F76616C756573203D207B5C6E20202020202020206669656C6453697A653A2033302C5C6E20202020202020206669656C644D61784C656E6774683A2038302C5C6E202020202020';
wwv_flow_imp.g_varchar2_table(12) := '2020646174614A534F4E3A207B7D2C5C6E2020202020202020637572725F6C616E675F696E6465783A20302C5C6E20202020202020206C616E6775616765733A207B7D2C5C6E20202020202020207461674D61703A207B7D2C5C6E20202020202020206D';
wwv_flow_imp.g_varchar2_table(13) := '657373616765733A204A534F4E2E7061727365287569772E6F7074696F6E732E6D65737361676573292C5C6E2020202020202020746F74616C4C616E6775616765733A20302C5C6E202020202020202064697361626C65643A2066616C73652C5C6E2020';
wwv_flow_imp.g_varchar2_table(14) := '2020202020206E65775265636F72643A2066616C73652C5C6E2020202020202020706F707570436C6173733A204449414C4F475F504F5055505F434C4153532C5C6E2020202020202020706F70757053454C3A20276469762E27202B204449414C4F475F';
wwv_flow_imp.g_varchar2_table(15) := '504F5055505F434C4153532C5C6E2020202020202020636F6E74726F6C6C65724D6F64653A207569772E6F7074696F6E732E636F6E74726F6C6C65724D6F64655C6E20202020207D3B5C6E5C6E20202020207569772E5F656C656D656E7473203D207B5C';
wwv_flow_imp.g_varchar2_table(16) := '6E20202020202020202477696E646F773A207B7D2C5C6E202020202020202024646F63756D656E743A207B7D2C5C6E202020202020202024626F64793A207B7D2C5C6E2020202020202020246974656D7365743A207B7D2C5C6E2020202020202020246D';
wwv_flow_imp.g_varchar2_table(17) := '6C73427574746F6E3A207B7D2C5C6E20202020202020202469673A207B7D2C5C6E202020202020202024677269643A207B7D2C5C6E2020202020202020246469616C6F673A207B7D2C5C6E2020202020202020246469616C6F67436F6E74656E743A207B';
wwv_flow_imp.g_varchar2_table(18) := '7D2C5C6E20202020202020202473617665427574746F6E3A207B7D2C5C6E20202020202020202463616E63656C427574746F6E3A207B7D2C5C6E202020202020202024627574746F6E436F6E7461696E65723A207B7D5C6E20202020207D3B5C6E20207D';
wwv_flow_imp.g_varchar2_table(19) := '2C5C6E5C6E5C6E5C6E20205F6372656174653A2066756E6374696F6E2829207B5C6E2020202076617220756977203D20746869732C5C6E2020202020202020696E69744A534F4E203D207B7D3B5C6E5C6E202020202F2F204F7074696F6E732061726520';
wwv_flow_imp.g_varchar2_table(20) := '616C7265616479206D657267656420616E642073746F72656420696E20746869732E6F7074696F6E7320286F72207569772E6F7074696F6E73295C6E202020207569772E6C6F67285C225F6372656174655C22293B5C6E202020207569772E6C6F672875';
wwv_flow_imp.g_varchar2_table(21) := '69772E6F7074696F6E732E6974656D4E616D65293B5C6E5C6E202020207569772E5F616464435353546F546F704C6576656C28293B5C6E5C6E202020207569772E5F6372656174655072697661746553746F7261676528293B5C6E202020207569772E5F';
wwv_flow_imp.g_varchar2_table(22) := '696E6974456C656D656E747328293B5C6E202020207569772E5F696E697442617365456C656D656E747328293B5C6E5C6E5C6E20202020747279207B7569772E5F76616C7565732E6C616E677561676573203D204A534F4E2E7061727365287569772E6F';
wwv_flow_imp.g_varchar2_table(23) := '7074696F6E732E6C616E675F636F646573293B7D5C6E20202020636174636820286529207B636F6E736F6C652E6572726F72285C2254686520646566696E6564206C616E67756167657320617265206E6F7420666F726D617474656420636F7272656374';
wwv_flow_imp.g_varchar2_table(24) := '6C792E205365652053686172656420436F6D706F6E657473203E20436F6D706F6E656E74732053657474696E6773203E204A544C204974656D205B506C75672D696E5D5C222C207569772E6F7074696F6E732E6C616E675F636F646573293B7D5C6E2020';
wwv_flow_imp.g_varchar2_table(25) := '20207569772E5F76616C7565732E746F74616C4C616E677561676573203D207569772E5F76616C7565732E6C616E6775616765732E6C656E6774683B5C6E5C6E2020202069662028217569772E5F76616C7565732E636F6E74726F6C6C65724D6F646520';
wwv_flow_imp.g_varchar2_table(26) := '7C7C207569772E656C656D656E742E64617461285C2276616C75655C22292029207B5C6E2020202020202F2F2057652061726520616E206E6F7420616E20494720636F6C756D6E20287768657265207468652076616C7565206973207365742076696120';
wwv_flow_imp.g_varchar2_table(27) := '646973706C617956616C7565466F7229205C6E2020202020202F2F206F722077652061726520616E206974656D207769746820616E20696E697469616C2076616C75655C6E202020202020696E69744A534F4E203D207569772E656C656D656E742E6461';
wwv_flow_imp.g_varchar2_table(28) := '7461285C2276616C75655C22293B5C6E202020207D5C6E5C6E202020202F2F2073657420746865206672657368206C697374206F66206C616E6775616765735C6E202020207569772E5F696E6974446174614A534F4E28696E69744A534F4E293B5C6E5C';
wwv_flow_imp.g_varchar2_table(29) := '6E202020202F2F20576869636820706F736974696F6E206C616E677561676520617265207765207573696E675C6E202020207569772E5F76616C7565732E637572725F6C616E675F696E646578203D207569772E5F6765744C616E6775616765496E6465';
wwv_flow_imp.g_varchar2_table(30) := '78287569772E6F7074696F6E732E6C616E67293B5C6E202020205C6E202020202F2F2053796E63206F7572204A534F4E20646174612D76616C7565206174747269627574652077697468207468652061637475616C2076616C756520696E207468652063';
wwv_flow_imp.g_varchar2_table(31) := '6F7272656374206C616E67756167652C206275745C6E202020202F2F20616C736F20647572696E672070616765207375626D697420746F206D616B652073757265207765207375626D69742074686520636F72726563742076616C7565205C6E20202020';
wwv_flow_imp.g_varchar2_table(32) := '7569772E5F6974656D245C6E202020202020202E62696E6428276368616E6765272C207B7569773A207569777D2C207569772E5F73796E634A534F4E64617461293B5C6E202020207569772E5F656C656D656E74732E24646F63756D656E745C6E202020';
wwv_flow_imp.g_varchar2_table(33) := '202020202E62696E642827617065786265666F7265706167657375626D6974272C207B7569773A207569777D2C207569772E5F73796E634A534F4E64617461293B5C6E5C6E202020207569772E5F656C656D656E74732E246D6C73427574746F6E5C6E20';
wwv_flow_imp.g_varchar2_table(34) := '2020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69636B293B5C6E5C6E202020202F2F20496E6974204150455820706167656974656D2066756E6374696F6E735C6E20202020';
wwv_flow_imp.g_varchar2_table(35) := '7569772E5F696E6974417065784974656D28293B5C6E5C6E202020202F2F20617065782E6A51756572792877696E646F77292E6F6E285C227468656D65343272656164795C222C2066756E6374696F6E2829207B5C6E20202020617065782E6A51756572';
wwv_flow_imp.g_varchar2_table(36) := '792877696E646F77292E6F6E285C22696E74657261637469766567726964766965776D6F64656C6372656174655C222C2066756E6374696F6E286576656E742C20756929207B202F2F2077696C6C207468697320776F726B20666F72206D756C7469706C';
wwv_flow_imp.g_varchar2_table(37) := '652049473F5C6E2020202020202F2F20696E69742074686520677269642076616C7565732C20627574207761697420756E74696C2074686520677269642069732072656164795C6E2020202020207569772E5F696E697447726964436F6E66696728293B';
wwv_flow_imp.g_varchar2_table(38) := '5C6E202020207D293B5C6E5C6E20207D2C5C6E5C6E5C6E20205F696E697447726964436F6E6669673A2066756E6374696F6E202829207B5C6E2020202076617220756977203D20746869732C5C6E2020202020202020726567696F6E203D20617065782E';
wwv_flow_imp.g_varchar2_table(39) := '726567696F6E2E66696E64436C6F73657374287569772E5F6974656D245B305D293B5C6E5C6E202020207569772E6C6F67285C225F696E697447726964436F6E6669675C22293B5C6E202020207569772E656C6F67285C227569772E5F6974656D245C22';
wwv_flow_imp.g_varchar2_table(40) := '2C207569772E5F6974656D24293B5C6E202020207569772E656C6F67285C22726567696F6E5C222C20726567696F6E293B5C6E5C6E20202020696620287569772E5F76616C7565732E636F6E74726F6C6C65724D6F646529207B5C6E2020202020202F2F';
wwv_flow_imp.g_varchar2_table(41) := '207569772E5F656C656D656E74732E2467726964203D20726567696F6E2E77696467657428292E696E74657261637469766547726964285C2267657443757272656E74566965775C22293B5C6E2020202020207569772E5F656C656D656E74732E246967';
wwv_flow_imp.g_varchar2_table(42) := '203D20726567696F6E2E77696467657428292E696E7465726163746976654772696428293B5C6E2020202020207569772E5F656C656D656E74732E2467726964203D20726567696F6E2E77696467657428292E696E74657261637469766547726964285C';
wwv_flow_imp.g_varchar2_table(43) := '2267657456696577735C22292E677269643B5C6E2020202020207569772E656C6F67285C225F656C656D656E74732E24677269643A5C222C207569772E5F656C656D656E74732E2467726964293B5C6E5C6E2F2A5C6E202020202020726567696F6E2E77';
wwv_flow_imp.g_varchar2_table(44) := '696467657428292E6F6E285C22696E74657261637469766567726964736176655C222C2066756E6374696F6E2829207B5C6E20202020202020202F2F20576F756C64206C696B6520746F2063616C6C20636C65617253656C656374696F6E282920696E73';
wwv_flow_imp.g_varchar2_table(45) := '746561642C206275742063616E277420666967757265206F757420686F772E5C6E20202020202020202F2F205475726E2065646974206F666620746F20666F7263652061206672657368206C6F6164206F66206461746120616761696E2E5C6E20202020';
wwv_flow_imp.g_varchar2_table(46) := '202020202F2F205965732C2074686973206973206120746F74616C206861636B2C20616E6420776F756C64206C6F766520746F206C6561726E206F6620612062657474657220617070726F6163685C6E20202020202020207569772E5F656C656D656E74';
wwv_flow_imp.g_varchar2_table(47) := '732E24677269642E736574456469744D6F64652866616C7365293B5C6E2020202020207D293B5C6E2A2F5C6E5C6E202020207D5C6E20202020656C7365207B5C6E2020202020207569772E6C6F67285C226E6F7420616E2049475C22293B5C6E20202020';
wwv_flow_imp.g_varchar2_table(48) := '7D5C6E5C6E20207D2C5C6E5C6E5C6E20205F7265736574466F6375733A2066756E6374696F6E202829207B5C6E2020202076617220756977203D20746869733B5C6E5C6E202020207569772E6C6F67285C225F7265736574466F6375735C22293B5C6E5C';
wwv_flow_imp.g_varchar2_table(49) := '6E20202020696620287569772E5F76616C7565732E636F6E74726F6C6C65724D6F646529207B20202F2F2061726520776520696E73696465206120677269643F5C6E2020202020202F2F2053696E63652077652068617665206120617065782E6974656D';
wwv_flow_imp.g_varchar2_table(50) := '28292E676574506F70757053656C6563746F72207468697320636F6465206973207265616C6C79206E6F74206E65636573736172795C6E2020202020202F2F20627574206974207365656D7320746F2070726F766964652061206D756368206265747465';
wwv_flow_imp.g_varchar2_table(51) := '72207573657220657870657269656E636520626563617365206F6E63652074686520706F70757020636C6F7365735C6E2020202020202F2F207765277265206261636B2065646974696E67207468652063656C6C206173206F70706F73656420746F2068';
wwv_flow_imp.g_varchar2_table(52) := '6176696E6720746F20666F726365207468652065646974696E672E5C6E5C6E2020202020202F2F207569772E656C6F67285C227569772E5F656C656D656E74732E24677269645C222C207569772E5F656C656D656E74732E2467726964293B5C6E202020';
wwv_flow_imp.g_varchar2_table(53) := '2020202F2F207569772E656C6F67285C227569772E5F656C656D656E74732E2469675C222C207569772E5F656C656D656E74732E246967293B5C6E5C6E202020202020747279207B5C6E20202020202020202F2F2066696E64206F757220636F6C756D6E';
wwv_flow_imp.g_varchar2_table(54) := '20696E2074686520677269645C6E20202020202020202F2F205468616E6B20796F7520746F204D656E6E6F20486F6F67656E64696A6B20666F7220706F7274696F6E73206F66207468697320636F64655C6E20202020202020202F2F2068747470733A2F';
wwv_flow_imp.g_varchar2_table(55) := '2F6769746875622E636F6D2F6D656E6E6F6F6F2F6F72636C617065782D6D6F64616C2D6C6F765C6E5C6E2020202020202020766172207265636F72644964203D207569772E5F656C656D656E74732E24677269642E6D6F64656C2E6765745265636F7264';
wwv_flow_imp.g_varchar2_table(56) := '4964287569772E5F656C656D656E74732E24677269642E76696577242E67726964282767657453656C65637465645265636F72647327295B305D293B5C6E202020202020202076617220636F6C756D6E203D207569772E5F656C656D656E74732E246967';
wwv_flow_imp.g_varchar2_table(57) := '2E696E7465726163746976654772696428276F7074696F6E27292E636F6E6669672E636F6C756D6E732E66696C7465722866756E6374696F6E2028636F6C756D6E29207B5C6E2020202020202020202072657475726E20636F6C756D6E2E737461746963';
wwv_flow_imp.g_varchar2_table(58) := '4964203D3D3D207569772E6F7074696F6E732E6974656D4E616D653B5C6E20202020202020207D295B305D3B5C6E20202020202020202F2F20676F20746F206F75722063656C6C20616E6420666F6375732069742020202020205C6E2020202020202020';
wwv_flow_imp.g_varchar2_table(59) := '7569772E5F656C656D656E74732E24677269642E76696577242E677269642827676F746F43656C6C272C207265636F726449642C20636F6C756D6E2E6E616D65293B5C6E20202020202020207569772E5F656C656D656E74732E24677269642E666F6375';
wwv_flow_imp.g_varchar2_table(60) := '7328293B5C6E2020202020207D5C6E202020202020636174636820286529207B5C6E2020202020202020636F6E736F6C652E7761726E285C22546865726520776572652070726F626C656D7320747279696E6720746F207265666F637573206F6E207468';
wwv_flow_imp.g_varchar2_table(61) := '652063656C6C206265696E67206564697465645C22293B5C6E2020202020207D5C6E5C6E202020207D20656C7365207B5C6E2020202020202F2F20776520617265206E6F7420696E206120677269642C20736F20666F63757320746865206974656D2074';
wwv_flow_imp.g_varchar2_table(62) := '6861742063616C6C65642075735C6E2020202020207569772E5F6974656D242E747269676765722827666F63757327293B5C6E202020207D5C6E20207D2C5C6E5C6E5C6E5C6E5C6E20205F696E6974417065784974656D3A2066756E6374696F6E202829';
wwv_flow_imp.g_varchar2_table(63) := '207B5C6E2020202076617220756977203D20746869733B5C6E5C6E202020207569772E6C6F67285C225F696E6974417065784974656D5C222C205C225265676973746572696E67207769746820617065782E6974656D2E63726561746520666F72205C22';
wwv_flow_imp.g_varchar2_table(64) := '202B207569772E6F7074696F6E732E6974656D4E616D65293B5C6E202020202F2F2053657420616E64206765742076616C75652076696120617065782066756E6374696F6E735C6E20202020617065782E6974656D2E637265617465287569772E6F7074';
wwv_flow_imp.g_varchar2_table(65) := '696F6E732E6974656D4E616D652C207B5C6E5C6E2020202020202073657456616C75653A2066756E6374696F6E287056616C75652C2070446973706C617956616C756529207B5C6E2020202020202020202076617220746578743B5C6E5C6E2020202020';
wwv_flow_imp.g_varchar2_table(66) := '20202020207569772E6C6F6728205C22617065782E6974656D2E73657456616C75655C222C207056616C75652C2070446973706C617956616C7565293B5C6E5C6E202020202020202020202F2F20546865204A534F4E20696E207056616C756520697320';
wwv_flow_imp.g_varchar2_table(67) := '74686520736F75726365206F6620747275746820666F72206576657279207472616E736C6174696F6E5C6E202020202020202020207569772E5F696E6974446174614A534F4E284A534F4E2E7061727365287056616C7565207C7C205C227B7D5C222929';
wwv_flow_imp.g_varchar2_table(68) := '3B5C6E5C6E202020202020202020202F2F20546865206E6577204A534F4E206D6179206F7264657220697473206C616E67756167657320646966666572656E746C79206F72206C65617665206F757273206F75742C5C6E202020202020202020202F2F20';
wwv_flow_imp.g_varchar2_table(69) := '736F2066696E64206F7572206C616E677561676520616761696E2E20546865206368616E676520616E64207375626D69742068616E646C657273207772697465207468655C6E202020202020202020202F2F206974656D207465787420696E746F207468';
wwv_flow_imp.g_varchar2_table(70) := '617420706F736974696F6E2028736565205F73796E634A534F4E64617461292E5C6E202020202020202020207569772E5F76616C7565732E637572725F6C616E675F696E646578203D207569772E5F6765744C616E6775616765496E646578287569772E';
wwv_flow_imp.g_varchar2_table(71) := '6F7074696F6E732E6C616E67293B5C6E5C6E202020202020202020202F2F2053686F7720746865207472616E736C6174696F6E206F66207468652063757272656E74206C616E67756167652E204F6E6C79207768656E20746865204A534F4E206861735C';
wwv_flow_imp.g_varchar2_table(72) := '6E202020202020202020202F2F206E6F6E6520646F207765207573652074686520646973706C61792076616C75652C206F7220616E20656D70747920737472696E6720776974686F7574206F6E652E5C6E2020202020202020202074657874203D207569';
wwv_flow_imp.g_varchar2_table(73) := '772E5F676574544C287569772E6F7074696F6E732E6C616E67293B5C6E202020202020202020206966202874657874203D3D3D20756E646566696E6564207C7C2074657874203D3D3D206E756C6C29207B5C6E2020202020202020202020202020746578';
wwv_flow_imp.g_varchar2_table(74) := '74203D2070446973706C617956616C7565207C7C205C225C223B5C6E202020202020202020207D5C6E5C6E202020202020202020202F2F20416C7761797320706173732074686520746578743A202E76616C282920776974686F757420616E2061726775';
wwv_flow_imp.g_varchar2_table(75) := '6D656E7420697320612067657474657220746861745C6E202020202020202020202F2F206C6561766573207468652070726576696F7573207465787420696E20746865206974656D20666F7220746865206368616E67652068616E646C657220746F2073';
wwv_flow_imp.g_varchar2_table(76) := '6176652E5C6E202020202020202020207569772E5F6974656D242E76616C2874657874293B5C6E5C6E202020202020207D2C5C6E2020202020202067657456616C75653A2066756E6374696F6E2829207B5C6E2020202020202020202072657475726E20';
wwv_flow_imp.g_varchar2_table(77) := '4A534F4E2E737472696E67696679287569772E5F76616C7565732E646174614A534F4E293B5C6E202020202020207D2C5C6E20202020202020736574466F6375733A2066756E6374696F6E2829207B5C6E202020202020202020207569772E5F6974656D';
wwv_flow_imp.g_varchar2_table(78) := '242E74726967676572285C22666F6375735C22293B5C6E202020202020207D2C5C6E20202020202020656E61626C653A2066756E6374696F6E2829207B5C6E202020202020202020207569772E656E61626C6528293B5C6E202020202020207D2C5C6E20';
wwv_flow_imp.g_varchar2_table(79) := '20202020202064697361626C653A2066756E6374696F6E2829207B5C6E202020202020202020207569772E64697361626C6528293B5C6E202020202020207D2C5C6E20202020202020676574506F70757053656C6563746F723A2066756E6374696F6E28';
wwv_flow_imp.g_varchar2_table(80) := '29207B5C6E2020202020202020202072657475726E207569772E5F76616C7565732E706F70757053454C3B5C6E202020202020207D2C5C6E20202020202020646973706C617956616C7565466F723A2066756E6374696F6E20287056616C756529207B5C';
wwv_flow_imp.g_varchar2_table(81) := '6E2020202020202020202076617220707265766A746C4A534F4E203D207B7D2C5C6E2020202020202020202020202020707265764E65775265636F72642C5C6E2020202020202020202020202020707265764C616E67496E6465782C5C6E202020202020';
wwv_flow_imp.g_varchar2_table(82) := '20202020202020206A746C4A534F4E203D207B7D2C5C6E202020202020202020202020202072657475726E56616C75653B5C6E202020202020202020202F2F205468652049472063616C6C73207468697320636F646520746F207365742074686520696E';
wwv_flow_imp.g_varchar2_table(83) := '697469616C20646973706C61792076616C7565735C6E202020202020202020207569772E6C6F67285C22617065782E6974656D2E646973706C617956616C7565466F725C222C207056616C7565293B5C6E20202020202020202020696620287056616C75';
wwv_flow_imp.g_varchar2_table(84) := '6529207B5C6E202020202020202020202020747279207B202F2F206A7573742070726F7465637420757320696620746865204A534F4E20697320696E76616C69645C6E20202020202020202020202020206A746C4A534F4E203D204A534F4E2E70617273';
wwv_flow_imp.g_varchar2_table(85) := '65287056616C7565293B5C6E2020202020202020202020207D5C6E202020202020202020202020636174636820286529207B5C6E2020202020202020202020207D5C6E5C6E5C6E202020202020202020207D5C6E202020202020202020202F2F20646973';
wwv_flow_imp.g_varchar2_table(86) := '706C617956616C7565466F722073686F756C64204E4F54206368616E67652073746174652C20736F2073746F72652065766572797468696E6720746861745C6E202020202020202020202F2F205F696E6974446174614A534F4E206368616E6765732028';
wwv_flow_imp.g_varchar2_table(87) := '697420616C736F2073657473206E65775265636F72642920616E6420726573746F72652069742062656C6F775C6E20202020202020202020707265766A746C4A534F4E203D207569772E5F76616C7565732E646174614A534F4E3B20202F2F2073746F72';
wwv_flow_imp.g_varchar2_table(88) := '652074686520707265762076616C75655C6E20202020202020202020707265764E65775265636F7264203D207569772E5F76616C7565732E6E65775265636F72643B5C6E20202020202020202020707265764C616E67496E646578203D207569772E5F76';
wwv_flow_imp.g_varchar2_table(89) := '616C7565732E637572725F6C616E675F696E6465783B5C6E202020202020202020207569772E5F696E6974446174614A534F4E286A746C4A534F4E293B5C6E2020202020202020202072657475726E56616C7565203D207569772E5F676574544C287569';
wwv_flow_imp.g_varchar2_table(90) := '772E6F7074696F6E732E6C616E67293B5C6E202020202020202020207569772E5F696E6974446174614A534F4E28707265766A746C4A534F4E293B2020202020202F2F20726573746F7265207468652076616C75655C6E20202020202020202020756977';
wwv_flow_imp.g_varchar2_table(91) := '2E5F76616C7565732E6E65775265636F7264203D20707265764E65775265636F72643B5C6E202020202020202020207569772E5F76616C7565732E637572725F6C616E675F696E646578203D20707265764C616E67496E6465783B5C6E5C6E2020202020';
wwv_flow_imp.g_varchar2_table(92) := '20202020202F2F2052657475726E20706C61696E20746578743A2049472065736361706573206974207468726F756768206D657461646174612E6573636170655F6F7574707574203D20747275652E5C6E202020202020202020202F2F20457363617069';
wwv_flow_imp.g_varchar2_table(93) := '6E6720686572652061732077656C6C20776F756C6420646F75626C652D657363617065207472616E736C6174696F6E732E5C6E2020202020202020202072657475726E2072657475726E56616C75653B5C6E202020202020207D5C6E202020207D293B5C';
wwv_flow_imp.g_varchar2_table(94) := '6E5C6E20207D2C5C6E5C6E5C6E5C6E20202F2F205468616E6B20796F7520746F204D656E6E6F20486F6F67656E64696A6B20666F72207468697320636F64655C6E20202F2F2068747470733A2F2F6769746875622E636F6D2F6D656E6E6F6F6F2F6F7263';
wwv_flow_imp.g_varchar2_table(95) := '6C617065782D6D6F64616C2D6C6F765C6E20205F616464435353546F546F704C6576656C3A2066756E6374696F6E202829207B5C6E2020202076617220756977203D20746869733B5C6E202020202F2F204353532066696C6520697320616C7761797320';
wwv_flow_imp.g_varchar2_table(96) := '70726573656E74207768656E207468652063757272656E742077696E646F772069732074686520746F702077696E646F772C20736F20646F206E6F7468696E675C6E202020206966202877696E646F77203D3D3D2077696E646F772E746F7029207B5C6E';
wwv_flow_imp.g_varchar2_table(97) := '20202020202072657475726E3B5C6E202020207D5C6E202020207661722063737353656C6563746F72203D20276C696E6B5B72656C3D5C227374796C6573686565745C225D5B687265662A3D5C226A746C5F6974656D5C225D273B5C6E5C6E202020202F';
wwv_flow_imp.g_varchar2_table(98) := '2F20436865636B2069662066696C652065786973747320696E20746F702077696E646F775C6E20202020696620287569772E5F746F70417065782E6A51756572792863737353656C6563746F72292E6C656E677468203D3D3D203029207B5C6E20202020';
wwv_flow_imp.g_varchar2_table(99) := '20207569772E5F746F70417065782E6A517565727928276865616427292E617070656E6428242863737353656C6563746F72292E636C6F6E652829293B5C6E202020207D5C6E20207D2C5C6E5C6E5C6E20205F696E6974456C656D656E74733A2066756E';
wwv_flow_imp.g_varchar2_table(100) := '6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E20202020207569772E5F656C656D656E74732E2477696E646F77203D207569772E5F746F70417065782E6A51756572792877696E646F77293B5C6E202020202075';
wwv_flow_imp.g_varchar2_table(101) := '69772E5F656C656D656E74732E24646F63756D656E74203D207569772E5F746F70417065782E6A51756572792877696E646F772E746F702E646F63756D656E74293B5C6E20202020207569772E5F656C656D656E74732E24626F6479203D207569772E5F';
wwv_flow_imp.g_varchar2_table(102) := '746F70417065782E6A51756572792877696E646F772E746F702E646F63756D656E742E626F6479293B5C6E5C6E20207D2C5C6E5C6E5C6E20205F696E69744469616C6F67456C656D656E74733A2066756E6374696F6E2829207B5C6E2020202020766172';
wwv_flow_imp.g_varchar2_table(103) := '20756977203D20746869733B5C6E5C6E20202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E74203D207569772E5F746F70417065782E6A517565727928276469762E6A746C6974656D2D636F6E74656E7427293B5C6E202020';
wwv_flow_imp.g_varchar2_table(104) := '20207569772E5F656C656D656E74732E2473617665427574746F6E203D207569772E5F746F70417065782E6A51756572792827627574746F6E2E6A746C6974656D2D736176652D627574746F6E27293B5C6E20202020207569772E5F656C656D656E7473';
wwv_flow_imp.g_varchar2_table(105) := '2E2463616E63656C427574746F6E203D207569772E5F746F70417065782E6A51756572792827627574746F6E2E6A746C6974656D2D63616E63656C2D627574746F6E27293B5C6E5C6E20207D2C5C6E5C6E5C6E20205F696E697442617365456C656D656E';
wwv_flow_imp.g_varchar2_table(106) := '74733A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E20202020207569772E6C6F6728205C225F696E697442617365456C656D656E74735C22293B5C6E20202020207569772E656C6F6728205C22656C';
wwv_flow_imp.g_varchar2_table(107) := '656D656E745C222C207569772E656C656D656E74293B5C6E5C6E20202020207569772E5F76616C7565732E6669656C6453697A65203D207569772E6F7074696F6E732E6974656D54797065203D3D3D205C22544558545C223F207569772E5F6974656D24';
wwv_flow_imp.g_varchar2_table(108) := '2E61747472285C2273697A655C2229203A207569772E5F6974656D242E61747472285C22636F6C735C22293B5C6E2020202020696620287569772E6F7074696F6E732E6974656D54797065203D3D3D205C2254455854415245415C2229207B5C6E202020';
wwv_flow_imp.g_varchar2_table(109) := '202020207569772E5F76616C7565732E6669656C64526F7773203D207569772E5F6974656D242E61747472285C22726F77735C22293B5C6E20202020207D5C6E20202020207569772E5F76616C7565732E6669656C644D61784C656E677468203D207569';
wwv_flow_imp.g_varchar2_table(110) := '772E5F6974656D242E61747472285C226D61786C656E6774685C22293B5C6E5C6E20202020202F2F205374617274696E67207769746820415045582031382E3120746865206974656D2073657420697320746865206974656D5772617070657220636C61';
wwv_flow_imp.g_varchar2_table(111) := '73735C6E20202020207569772E5F656C656D656E74732E246974656D736574203D207569772E5F6974656D242E706172656E7428293B5C6E20202020207569772E5F656C656D656E74732E246D6C73427574746F6E203D207569772E5F656C656D656E74';
wwv_flow_imp.g_varchar2_table(112) := '732E246974656D7365742E66696E642827627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E27293B5C6E20207D2C5C6E5C6E5C6E20202F2F205F73796E634C616E67756167654D617020696E69746973207468652062617365206461746120';
wwv_flow_imp.g_varchar2_table(113) := '666F72205F676574544C5C6E20202F2F20497420637265617465732061206D6170206F66206C616E677561676520636F64657320616E642074686569722076616C75657320666F722066617374206163636573735C6E20205F73796E634C616E67756167';
wwv_flow_imp.g_varchar2_table(114) := '654D61703A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869732C5C6E20202020202020202069203D206E756C6C2C5C6E20202020202020202074616773203D207B7D3B5C6E5C6E20202020207569772E6C6F6728205C';
wwv_flow_imp.g_varchar2_table(115) := '225F73796E634C616E67756167654D61705C22293B5C6E202020202074616773203D207569772E5F76616C7565732E646174614A534F4E3B5C6E5C6E20202020202F2F20687474703A2F2F6D617474736E696465722E636F6D2F686F772D746F2D656666';
wwv_flow_imp.g_varchar2_table(116) := '696369656E746C792D7365617263682D612D6A736F6E2D61727261792F5C6E20202020207569772E5F76616C7565732E7461674D6170203D207B7D3B5C6E2020202020666F72202869203D20303B20746167732E6C656E677468203E20693B2069202B3D';
wwv_flow_imp.g_varchar2_table(117) := '203129207B5C6E2020202020202020207569772E5F76616C7565732E7461674D61705B746167735B695D2E6C5D203D20746167735B695D2E746C3B5C6E2020202020202020202F2F20636F6E736F6C652E6C6F6728692C205C225B5C22202B2074616773';
wwv_flow_imp.g_varchar2_table(118) := '5B695D2E6C202B205C225D203D205C222C20746167735B695D2E746C295C6E20202020207D5C6E2020202020205C6E20207D2C5C6E5C6E5C6E20202F2F2067657420746865206C616E67756167652076616C756520666F72206120676976656E206C616E';
wwv_flow_imp.g_varchar2_table(119) := '677561676520636F64655C6E20205F676574544C3A2066756E6374696F6E286C616E67436F646529207B5C6E202020202076617220756977203D20746869733B5C6E202020202072657475726E207569772E5F76616C7565732E7461674D61705B6C616E';
wwv_flow_imp.g_varchar2_table(120) := '67436F64655D3B5C6E20207D2C5C6E5C6E5C6E20202F2F206765742074686520696E64657820706F736974696F6E206F662061206C616E677561676520636F646520696E2074686520646174614A534F4E2C206F72202D312069662069742773206E6F74';
wwv_flow_imp.g_varchar2_table(121) := '2074686572655C6E20205F6765744C616E6775616765496E6465783A2066756E6374696F6E286C616E67436F646529207B5C6E202020202076617220756977203D20746869732C5C6E2020202020202020206A203D207569772E5F76616C7565732E6461';
wwv_flow_imp.g_varchar2_table(122) := '74614A534F4E2C5C6E20202020202020202069203D206E756C6C2C5C6E202020202020202020696478203D202D313B5C6E5C6E2020202020666F72202869203D20303B206A2E6C656E677468203E206920262620696478203D3D202D313B2069202B3D20';
wwv_flow_imp.g_varchar2_table(123) := '3129207B5C6E20202020202020696620286A5B695D2E6C203D3D3D206C616E67436F646529207B5C6E202020202020202020696478203D20693B5C6E202020202020207D5C6E20202020207D5C6E202020202072657475726E206964783B5C6E20207D2C';
wwv_flow_imp.g_varchar2_table(124) := '5C6E5C6E5C6E5C6E20202F2F20657870656374732061206A746C4A534F4E20737472756374757265206F7220616E20656D707479206F626A6563745C6E20205F696E6974446174614A534F4E3A2066756E6374696F6E286A746C4A534F4E297B5C6E2020';
wwv_flow_imp.g_varchar2_table(125) := '20202076617220756977203D20746869732C5C6E2020202020202020206A736F6E44617461203D205B5D2C5C6E202020202020202020696E7075745F64617461203D206A746C4A534F4E207C7C207B7D3B5C6E5C6E2020202020202020207569772E6C6F';
wwv_flow_imp.g_varchar2_table(126) := '67285C225F696E6974446174614A534F4E5C22293B5C6E2020202020202020207569772E656C6F67287B696E7075745F646174617D293B5C6E5C6E202020202069662028617065782E6A51756572792E6973456D7074794F626A65637428696E7075745F';
wwv_flow_imp.g_varchar2_table(127) := '646174612929207B5C6E20202020202020207569772E6C6F67285C22496E697469616C697A696E67207769746820656D7074792076616C75655C22293B5C6E5C6E20202020202020202F2F20546865207265636F726420697320656D70747920736F2077';
wwv_flow_imp.g_varchar2_table(128) := '65206275696C642061205C6E20202020202020202F2F206275696C64204A534F4E207769746820746869732073747275637475726520746F20736565642069743A5C6E20202020202020202F2F20205B207B5C226C5C223A205C2275735C222C205C2274';
wwv_flow_imp.g_varchar2_table(129) := '6C5C223A205C2250726F6A65637420416E616C797369735C227D5C6E20202020202020202F2F20202C207B5C226C5C223A205C2266725C222C205C22746C5C223A205C22416E616C7973652064652070726F6A65745C227D5C6E20202020202020202F2F';
wwv_flow_imp.g_varchar2_table(130) := '20202C207B5C226C5C223A205C2265735C222C205C22746C5C223A205C22416E616C697369732064652070726F6A6563746F5C227D5D5C6E20202020202020207569772E5F76616C7565732E6C616E6775616765732E666F72456163682866756E637469';
wwv_flow_imp.g_varchar2_table(131) := '6F6E286C29207B5C6E20202020202020202020206A736F6E446174612E70757368287B5C226C5C223A206C2C205C22746C5C223A205C225C227D293B5C6E20202020202020207D293B5C6E5C6E20202020202020207569772E5F76616C7565732E646174';
wwv_flow_imp.g_varchar2_table(132) := '614A534F4E203D206A736F6E446174613B5C6E20202020202020207569772E5F76616C7565732E6E65775265636F7264203D20747275653B5C6E20202020207D5C6E2020202020656C7365207B5C6E202020202020207569772E5F76616C7565732E6461';
wwv_flow_imp.g_varchar2_table(133) := '74614A534F4E203D20696E7075745F646174613B5C6E202020202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B5C6E20202020207D5C6E5C6E20202020207569772E5F73796E634C616E67756167654D617028293B5C';
wwv_flow_imp.g_varchar2_table(134) := '6E5C6E20207D2C5C6E5C6E5C6E20202F2F204D61696E7461696E7320746865204A544C204A534F4E206461746120696E2073796E632E5C6E20202F2F206966206372656174696E672061206E6577207265636F72642C20616C6C2074686520656E746572';
wwv_flow_imp.g_varchar2_table(135) := '65642076616C75657320617265207573656420666F7220414C4C20746865206C616E6775616765735C6E20202F2F206F74686572776973652074686520656E74657265642076616C756520676F657320696E746F2074686520637572725F6C616E675F69';
wwv_flow_imp.g_varchar2_table(136) := '6E646578206F6E6C795C6E20205F73796E634A534F4E646174613A2066756E6374696F6E286576656E744F626A29207B5C6E20202020202F2F2076617220756977203D206576656E744F626A2E646174612E7569772C5C6E202020202076617220756977';
wwv_flow_imp.g_varchar2_table(137) := '3B5C6E5C6E202020202069662028747970656F66206576656E744F626A20213D205C22756E646566696E65645C2229207B5C6E20202020202020202F2F20776520776572652063616C6C2066726F6D20616E206576656E745C6E20202020202020207569';
wwv_flow_imp.g_varchar2_table(138) := '77203D206576656E744F626A2E646174612E7569773B5C6E20202020207D5C6E2020202020656C7365207B5C6E20202020202020202F2F206469726563742063616C6C5C6E2020202020202020756977203D20746869733B5C6E20202020207D5C6E2020';
wwv_flow_imp.g_varchar2_table(139) := '2020207569772E6C6F67285C225F73796E634A534F4E646174615C22293B5C6E5C6E2020202020696620287569772E5F76616C7565732E6E65775265636F726429207B5C6E20202020202020202F2F204F6E206E6577207265636F72642077652077616E';
wwv_flow_imp.g_varchar2_table(140) := '7420746F207361766520746865206E657720656E74657265642076616C756520696E746F2074686520414C4C207468655C6E20202020202020202F2F207265636F72647320696E20746865204A534F4E207374727563747572655C6E2020202020202020';
wwv_flow_imp.g_varchar2_table(141) := '666F7220287661722069203D207569772E5F76616C7565732E746F74616C4C616E677561676573202D20313B2069203E3D20303B20692D2D29207B5C6E202020202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E746C203D20';
wwv_flow_imp.g_varchar2_table(142) := '7569772E5F6974656D242E76616C28293B5C6E20202020202020207D5C6E20202020207D5C6E2020202020656C736520696620287569772E5F76616C7565732E637572725F6C616E675F696E646578203E3D203029207B5C6E20202020202020202F2F20';
wwv_flow_imp.g_varchar2_table(143) := '7361766520746865206E6577207465787420696E746F20746865204A534F4E2073747275637475726520666F72207468652063757272656E74206C616E67756167655C6E20202020202020207569772E5F76616C7565732E646174614A534F4E5B756977';
wwv_flow_imp.g_varchar2_table(144) := '2E5F76616C7565732E637572725F6C616E675F696E6465785D2E746C203D207569772E5F6974656D242E76616C28293B5C6E20202020207D5C6E2020202020656C736520696620287569772E5F6974656D242E76616C282920213D3D205C225C2229207B';
wwv_flow_imp.g_varchar2_table(145) := '5C6E20202020202020202F2F20546865204A534F4E20686173206E6F20656E74727920666F72207468652063757272656E74206C616E67756167652E20416464206F6E6520736F2074686520746578742069735C6E20202020202020202F2F2073617665';
wwv_flow_imp.g_varchar2_table(146) := '642C206974206D757374206E6576657220656E6420757020696E20616E6F74686572206C616E67756167652E5C6E20202020202020207569772E5F76616C7565732E646174614A534F4E2E70757368287B5C226C5C223A207569772E6F7074696F6E732E';
wwv_flow_imp.g_varchar2_table(147) := '6C616E672C205C22746C5C223A207569772E5F6974656D242E76616C28297D293B5C6E20202020202020207569772E5F76616C7565732E637572725F6C616E675F696E646578203D207569772E5F76616C7565732E646174614A534F4E2E6C656E677468';
wwv_flow_imp.g_varchar2_table(148) := '202D20313B5C6E20202020207D5C6E5C6E20202020207569772E5F73796E634C616E67756167654D617028293B5C6E20207D2C5C6E5C6E5C6E5C6E20205F696E69744469616C6F67427574746F6E733A2066756E6374696F6E2829207B5C6E2020202020';
wwv_flow_imp.g_varchar2_table(149) := '76617220756977203D20746869733B5C6E5C6E20202020207569772E5F656C656D656E74732E2463616E63656C427574746F6E5C6E20202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C6543';
wwv_flow_imp.g_varchar2_table(150) := '616E63656C427574746F6E436C69636B293B5C6E5C6E20202020207569772E5F656C656D656E74732E2473617665427574746F6E5C6E20202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C65';
wwv_flow_imp.g_varchar2_table(151) := '53617665427574746F6E436C69636B293B5C6E5C6E20207D2C5C6E5C6E5C6E5C6E20205F68616E646C6543616E63656C427574746F6E436C69636B3A2066756E6374696F6E286576656E744F626A29207B5C6E202020202076617220756977203D206576';
wwv_flow_imp.g_varchar2_table(152) := '656E744F626A2E646174612E7569773B5C6E5C6E20202020202F2F20696620746865206469616C6F67206F70656E732C207765277265206E6F742061206E6577207265636F726420616E79206D6F72655C6E20202020207569772E5F76616C7565732E6E';
wwv_flow_imp.g_varchar2_table(153) := '65775265636F7264203D2066616C73653B5C6E5C6E20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B202F2F20746869732073686F756C64206361736361646520746F2072656D6F7665207468';
wwv_flow_imp.g_varchar2_table(154) := '65206469616C6F675C6E5C6E20207D2C5C6E5C6E5C6E5C6E20205F68616E646C6553617665427574746F6E436C69636B3A2066756E6374696F6E286576656E744F626A29207B5C6E202020202076617220756977203D206576656E744F626A2E64617461';
wwv_flow_imp.g_varchar2_table(155) := '2E7569772C5C6E202020202020202020646973706C61795F76616C75653B5C6E5C6E20202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E6428272E6A746C6974656D2D76616C756527292E656163682866756E63';
wwv_flow_imp.g_varchar2_table(156) := '74696F6E28692C656C297B5C6E20202020202020202F2F206C6F6F70207468726F75676820616C6C206469616C6F6720656C656D656E747320616E642073746F7265207472616E736C6174696F6E735C6E20202020202020202F2F206261636B20696E74';
wwv_flow_imp.g_varchar2_table(157) := '6F2074686520646174614A534F4E207374727563747572652E5C6E20202020202020202F2F2046696E642065616368206C616E67756167652062792069747320636F64653A20746865204A534F4E206D6179206F7264657220697473206C616E67756167';
wwv_flow_imp.g_varchar2_table(158) := '65735C6E20202020202020202F2F20646966666572656E746C79207468616E2074686520636F6E66696775726174696F6E2C206C6561766520736F6D65206F7574206F722068617665206D6F72652E5C6E202020202020202076617220696478203D2075';
wwv_flow_imp.g_varchar2_table(159) := '69772E5F6765744C616E6775616765496E64657828656C2E646174617365742E6C616E67293B5C6E5C6E20202020202020202F2F207569772E6C6F672869202B205C22285C22202B20656C2E646174617365742E6C616E67202B205C22293A5C22202B20';
wwv_flow_imp.g_varchar2_table(160) := '656C2E76616C7565293B5C6E5C6E202020202020202069662028696478203E3D203029207B5C6E20202020202020202020207569772E5F76616C7565732E646174614A534F4E5B6964785D2E746C203D20656C2E76616C75653B5C6E2020202020202020';
wwv_flow_imp.g_varchar2_table(161) := '7D5C6E2020202020202020656C73652069662028656C2E76616C756520213D3D205C225C2229207B5C6E20202020202020202020202F2F206E6F20656E74727920666F722074686973206C616E6775616765207965742C20616464206F6E6520736F2074';
wwv_flow_imp.g_varchar2_table(162) := '686520746578742069732073617665645C6E20202020202020202020207569772E5F76616C7565732E646174614A534F4E2E70757368287B5C226C5C223A20656C2E646174617365742E6C616E672C205C22746C5C223A20656C2E76616C75657D293B5C';
wwv_flow_imp.g_varchar2_table(163) := '6E20202020202020207D5C6E5C6E20202020207D293B5C6E5C6E20202020207569772E5F73796E634C616E67756167654D617028293B5C6E5C6E20202020202F2F20776527726520646F6E65205C22736176696E675C22206261636B2066726F6D207468';
wwv_flow_imp.g_varchar2_table(164) := '65206469616C6F672C20636C65617220746865206E65775265636F726420666C61675C6E20202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B5C6E5C6E20202020202F2F2074686520706F736974696F6E73206F6620';
wwv_flow_imp.g_varchar2_table(165) := '746865206C616E677561676573206D61792068617665206368616E6765642C2066696E64206F75727320616761696E5C6E20202020207569772E5F76616C7565732E637572725F6C616E675F696E646578203D207569772E5F6765744C616E6775616765';
wwv_flow_imp.g_varchar2_table(166) := '496E646578287569772E6F7074696F6E732E6C616E67293B5C6E5C6E2020202020646973706C61795F76616C7565203D207569772E5F676574544C287569772E6F7074696F6E732E6C616E67293B5C6E202020202069662028646973706C61795F76616C';
wwv_flow_imp.g_varchar2_table(167) := '756520213D3D20756E646566696E656420262620646973706C61795F76616C756520213D3D206E756C6C29207B5C6E20202020202020207569772E5F6974656D242E76616C28646973706C61795F76616C7565293B5C6E20202020207D5C6E2020202020';
wwv_flow_imp.g_varchar2_table(168) := '7569772E5F7369676E616C4368616E676528293B5C6E5C6E20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B202F2F20746869732073686F756C64206361736361646520746F2072656D6F7665';
wwv_flow_imp.g_varchar2_table(169) := '20746865206469616C6F675C6E20207D2C5C6E5C6E5C6E20205F7369676E616C4368616E67653A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E20202020202F2F204E65656420746F20757365206170';
wwv_flow_imp.g_varchar2_table(170) := '65782E6A517565727920666F7220746865206576656E747320746F207265676973746572207769746820746865204441206672616D65776F726B5C6E2020202020617065782E6A5175657279287569772E5F6974656D245B305D292E7472696767657228';
wwv_flow_imp.g_varchar2_table(171) := '276368616E676527293B5C6E20207D2C5C6E5C6E5C6E20205F68616E646C654F70656E436C69636B3A2066756E6374696F6E286576656E744F626A29207B5C6E202020202076617220756977203D206576656E744F626A2E646174612E7569773B5C6E5C';
wwv_flow_imp.g_varchar2_table(172) := '6E20202020207569772E6C6F67285C225F68616E646C654F70656E436C69636B5C22293B5C6E5C6E20202020207569772E5F73796E634A534F4E64617461286576656E744F626A293B5C6E20202020207569772E5F73686F774469616C6F6728293B5C6E';
wwv_flow_imp.g_varchar2_table(173) := '20207D2C5C6E5C6E5C6E20205F73686F774469616C6F673A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869732C5C6E2020202020202020204449414C4F475F434C415353203D202775692D6469616C6F67272C20202F';
wwv_flow_imp.g_varchar2_table(174) := '2F2077652070726566657220697420746F202775692D6469616C6F672D2D617065782720746F2061766F69642072652D63656E746572696E675C6E2020202020202020206C616E675461626C652C5C6E2020202020202020206469616C6F67506F736974';
wwv_flow_imp.g_varchar2_table(175) := '696F6E2C5C6E2020202020202020206469616C6F6748746D6C3B5C6E5C6E20202020207569772E6C6F67285C225F73686F774469616C6F675C22293B5C6E5C6E5C6E2020202020696620287569772E5F76616C7565732E636F6E74726F6C6C65724D6F64';
wwv_flow_imp.g_varchar2_table(176) := '65207C7C2021617065782E6A51756572792E6973456D7074794F626A656374287569772E5F656C656D656E74732E24677269642929207B5C6E20202020202020207569772E6C6F6728277765206469646E5C5C277420676574206120686F6C64206F6620';
wwv_flow_imp.g_varchar2_table(177) := '74686520677269642C206D617962652074727920616761696E27293B5C6E20202020202020207569772E5F696E697447726964436F6E66696728293B5C6E20202020207D5C6E5C6E20202020206C616E675461626C65203D205C6E202020202020202020';
wwv_flow_imp.g_varchar2_table(178) := '2020273C7461626C6520636C6173733D5C22742D5265706F72742D7265706F72745C222073756D6D6172793D5C22417661696C61626C65205472616E736C6174696F6E735C223E5C5C6E27202B5C6E202020202020202020202027203C74723E5C5C6E27';
wwv_flow_imp.g_varchar2_table(179) := '202B5C6E20202020202020202020202720203C746820636C6173733D5C22742D5265706F72742D636F6C486561645C223E27202B207569772E5F76616C7565732E6D657373616765732E6C616E67756167654C6162656C202B20273C2F74683E27202B5C';
wwv_flow_imp.g_varchar2_table(180) := '6E20202020202020202020202720203C746820636C6173733D5C22742D5265706F72742D636F6C4865616420752D744C5C223E27202B207569772E5F76616C7565732E6D657373616765732E6C616E677561676556616C7565202B20273C2F74683E2720';
wwv_flow_imp.g_varchar2_table(181) := '2B5C6E202020202020202020202027203C2F74723E5C5C6E273B5C6E20202020202020202020202F2F2027203C74723E5C5C6E273B5C6E5C6E2020202020242E65616368287569772E5F76616C7565732E6C616E6775616765732C2066756E6374696F6E';
wwv_flow_imp.g_varchar2_table(182) := '2820696E6465782C206C616E672029207B5C6E202020202020202F2F20746865207472616E736C6174696F6E206F662074686973206C616E67756167652C20746865204A534F4E206D6179206E6F742068617665206F6E655C6E20202020202020766172';
wwv_flow_imp.g_varchar2_table(183) := '207472616E736C6174696F6E203D207569772E5F676574544C286C616E67293B5C6E20202020202020696620287472616E736C6174696F6E203D3D3D20756E646566696E6564207C7C207472616E736C6174696F6E203D3D3D206E756C6C29207B5C6E20';
wwv_flow_imp.g_varchar2_table(184) := '20202020202020207472616E736C6174696F6E203D205C225C223B5C6E202020202020207D5C6E5C6E202020202020206C616E675461626C65202B3D5C6E2020202020202027203C747227202B20286C616E67203D3D3D207569772E6F7074696F6E732E';
wwv_flow_imp.g_varchar2_table(185) := '6C616E673F202720636C6173733D5C2273656C65637465645C22273A272729202B20273E5C5C6E27202B5C6E202020202020202720203C746420636C6173733D5C22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E65';
wwv_flow_imp.g_varchar2_table(186) := '7220752D74435C223E27202B20617065782E7574696C2E65736361706548544D4C41747472286C616E6729202B20273C2F74643E27202B5C6E202020202020202720203C746420636C6173733D5C22742D5265706F72742D63656C6C20742D466F726D2D';
wwv_flow_imp.g_varchar2_table(187) := '696E707574436F6E7461696E657220752D744C5C223E273B5C6E20202020202020696620287569772E6F7074696F6E732E6974656D54797065203D3D3D205C22544558545C2229207B5C6E2020202020202020206C616E675461626C65202B3D5C6E2020';
wwv_flow_imp.g_varchar2_table(188) := '2020202020202027202020203C696E70757420747970653D5C22746578745C2220636C6173733D5C22746578745F6669656C6420617065782D6974656D2D74657874206A746C6974656D2D76616C75655C2220646174612D6C616E673D5C2227202B206C';
wwv_flow_imp.g_varchar2_table(189) := '616E67202B20275C222076616C75653D5C2227202B20617065782E7574696C2E65736361706548544D4C41747472287472616E736C6174696F6E29202B20275C222073697A653D5C2227202B207569772E5F76616C7565732E6669656C6453697A65202B';
wwv_flow_imp.g_varchar2_table(190) := '20275C22206D61786C656E6774683D5C2227202B207569772E5F76616C7565732E6669656C644D61784C656E677468202B20275C223E3C2F74643E273B5C6E202020202020207D5C6E20202020202020656C7365207B5C6E2020202020202020206C616E';
wwv_flow_imp.g_varchar2_table(191) := '675461626C65202B3D5C6E20202020202020202027202020203C746578746172656120636C6173733D5C22746578746172656120617065782D6974656D2D7465787461726561206A746C6974656D2D76616C75655C2220646174612D6C616E673D5C2227';
wwv_flow_imp.g_varchar2_table(192) := '202B206C616E67202B20275C2227202B5C6E20202020202020202020202020202720636F6C733D5C2227202B207569772E5F76616C7565732E6669656C6453697A65202B20275C2220726F77733D5C2227202B207569772E5F76616C7565732E6669656C';
wwv_flow_imp.g_varchar2_table(193) := '64526F7773202B20275C2227202B205C6E202020202020202020202020202027206D61786C656E6774683D5C2227202B207569772E5F76616C7565732E6669656C644D61784C656E677468202B20275C2227202B205C6E20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(194) := '20273E27202B20617065782E7574696C2E65736361706548544D4C41747472287472616E736C6174696F6E29202B20273C2F74657874617265613E273B5C6E202020202020207D5C6E5C6E202020202020206C616E675461626C65202B3D5C6E20202020';
wwv_flow_imp.g_varchar2_table(195) := '2020202027203C2F74723E5C5C6E273B5C6E20202020207D293B5C6E20202020206C616E675461626C65202B3D5C6E2020202020273C2F7461626C653E5C5C6E273B5C6E5C6E2020202020206469616C6F6748746D6C203D5C6E20202020202020202020';
wwv_flow_imp.g_varchar2_table(196) := '20273C64697620636C6173733D5C2227202B207569772E5F76616C7565732E706F707570436C617373202B20275C223E3C64697620636C6173733D5C226A746C6974656D2D636F6E7461696E65722075692D7769646765745C223E5C5C6E27202B5C6E20';
wwv_flow_imp.g_varchar2_table(197) := '202020202020202020202720203C64697620636C6173733D5C226A746C6974656D2D627574746F6E2D636F6E7461696E65725C223E5C5C6E27202B5C6E20202020202020202020202720202020203C627574746F6E20636C6173733D5C226A746C697465';
wwv_flow_imp.g_varchar2_table(198) := '6D2D63616E63656C2D627574746F6E20742D427574746F6E5C223E27202B5C6E202020202020202020202027202020202020203C7370616E20636C6173733D5C22742D427574746F6E2D6C6162656C5C223E27202B207569772E5F76616C7565732E6D65';
wwv_flow_imp.g_varchar2_table(199) := '7373616765732E63616E63656C427574746F6E202B20273C2F7370616E3E27202B5C6E20202020202020202020202F2F2027202020202020203C7370616E20636C6173733D5C2275692D69636F6E2075692D69636F6E2D636C6F73655C223E3C2F737061';
wwv_flow_imp.g_varchar2_table(200) := '6E3E27202B205C6E20202020202020202020202720202020203C2F627574746F6E3E5C5C6E27202B5C6E20202020202020202020202720202020203C627574746F6E20636C6173733D5C226A746C6974656D2D736176652D627574746F6E20742D427574';
wwv_flow_imp.g_varchar2_table(201) := '746F6E20742D427574746F6E2D2D686F745C223E27202B205C6E202020202020202020202027202020202020203C7370616E20636C6173733D5C22742D427574746F6E2D6C6162656C5C223E27202B207569772E5F76616C7565732E6D65737361676573';
wwv_flow_imp.g_varchar2_table(202) := '2E6170706C794368616E676573202B20273C2F7370616E3E27202B5C6E202020202020202020202027202020202020203C7370616E20636C6173733D5C22742D49636F6E20742D49636F6E2D2D72696768742066612066612D636865636B5C223E3C2F73';
wwv_flow_imp.g_varchar2_table(203) := '70616E3E27202B205C6E20202020202020202020202720202020203C2F627574746F6E3E5C5C6E27202B5C6E20202020202020202020202720203C2F6469763E5C5C6E27202B5C6E20202020202020202020202720203C64697620636C6173733D5C226A';
wwv_flow_imp.g_varchar2_table(204) := '746C6974656D2D636F6E74656E745C223E5C5C6E27202B5C6E20202020202020202020202020206C616E675461626C65202B5C6E20202020202020202020202720203C2F6469763E5C5C6E27202B5C6E2020202020202020202020273C2F6469763E3C2F';
wwv_flow_imp.g_varchar2_table(205) := '6469763E5C5C6E273B5C6E5C6E20202020207569772E5F656C656D656E74732E24626F64792E617070656E64286469616C6F6748746D6C293B5C6E5C6E20202020202F2F2072656164792061206469616C6F6720636F6E7461696E657220627920637265';
wwv_flow_imp.g_varchar2_table(206) := '6174696E672061206469765C6E20202020202F2F207569772E5F656C656D656E74732E246469616C6F67203D202428706F70757053454C293B5C6E20202020207569772E5F656C656D656E74732E246469616C6F67203D207569772E5F746F7041706578';
wwv_flow_imp.g_varchar2_table(207) := '2E6A5175657279287569772E5F76616C7565732E706F70757053454C293B5C6E5C6E20202020202F2F206469616C6F67506F736974696F6E203D207569772E5F6974656D242E6F666673657428293B20202F2F20706F736974696F6E206E65787420746F';
wwv_flow_imp.g_varchar2_table(208) := '20746865206974656D5C6E20202020206966202877696E646F77203D3D3D2077696E646F772E746F7029207B5C6E20202020202020206469616C6F67506F736974696F6E203D207B206D793A205C226C6566745C222C2061743A205C226C656674206365';
wwv_flow_imp.g_varchar2_table(209) := '6E7465725C222C206F663A207569772E5F6974656D245B305D207D3B20202F2F20706F736974696F6E206E65787420746F20746865206974656D5C6E20202020207D5C6E2020202020656C7365207B5C6E20202020202020202F2F20706F736974696F6E';
wwv_flow_imp.g_varchar2_table(210) := '206261736564206F6E20746865206469616C6F67202863656E746572656421295C6E20202020202020206469616C6F67506F736974696F6E203D207B206D793A205C2263656E7465722063656E7465725C222C2061743A205C2263656E7465722063656E';
wwv_flow_imp.g_varchar2_table(211) := '7465725C222C206F663A207569772E5F746F70417065782E6A517565727928272E272B4449414C4F475F434C415353295B305D207D3B5C6E20202020207D5C6E5C6E20202020202F2F206F70656E2063726561746564206469762061732061206469616C';
wwv_flow_imp.g_varchar2_table(212) := '6F675C6E20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F67287B5C6E202020202020202020636C6F73654F6E4573636170653A20747275652C5C6E2020202020202020207469746C653A2020202020202020207569772E';
wwv_flow_imp.g_varchar2_table(213) := '6F7074696F6E732E6469616C6F675469746C652C5C6E2020202020202020206175746F526573697A653A20202020747275652C5C6E2020202020202020206D696E57696474683A2020202020203430302C5C6E2020202020202020206D696E4865696768';
wwv_flow_imp.g_varchar2_table(214) := '743A20202020203235302C5C6E20202020202020202077696474683A202020202020202020276175746F272C5C6E2020202020202020206865696768743A2020202020202020276175746F272C5C6E2020202020202020206D6F64616C3A202020202020';
wwv_flow_imp.g_varchar2_table(215) := '202020747275652C5C6E2020202020202020206469616C6F67436C6173733A2020204449414C4F475F434C4153532C5C6E202020202020202020706F736974696F6E3A2020202020206469616C6F67506F736974696F6E2C5C6E2020202020202020206F';
wwv_flow_imp.g_varchar2_table(216) := '70656E3A2066756E6374696F6E2829207B5C6E2020202020202020202020202F2F207569772E5F746F70417065782E6E617669676174696F6E2E626567696E467265657A655363726F6C6C28293B5C6E2020202020202020202020207569772E5F696E69';
wwv_flow_imp.g_varchar2_table(217) := '744469616C6F67456C656D656E747328293B5C6E2020202020202020202020207569772E5F696E69744469616C6F67427574746F6E7328293B5C6E5C6E2020202020202020202020202F2F20466F637573206F6E207468652066697273742076616C7565';
wwv_flow_imp.g_varchar2_table(218) := '206F66207468652063757272656E74206C616E6775616765205C6E2020202020202020202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E64282774722E73656C6563746564202E6A746C6974656D2D76616C7565';
wwv_flow_imp.g_varchar2_table(219) := '27292E747269676765722827666F63757327293B5C6E2020202020202020207D2C5C6E202020202020202020636C6F73653A2066756E6374696F6E2829207B5C6E5C6E2020202020202020202020202F2F20242874686973292E6469616C6F6728276465';
wwv_flow_imp.g_varchar2_table(220) := '7374726F7927293B5C6E2020202020202020202020207569772E5F656C656D656E74732E246469616C6F672E72656D6F766528293B5C6E2020202020202020202020207569772E5F656C656D656E74732E24646F63756D656E742E66696E64287569772E';
wwv_flow_imp.g_varchar2_table(221) := '5F76616C7565732E706F70757053454C292E72656D6F766528293B5C6E2020202020202020202020202F2F207569772E5F746F70417065782E6E617669676174696F6E2E656E64467265657A655363726F6C6C28293B5C6E5C6E20202020202020202020';
wwv_flow_imp.g_varchar2_table(222) := '20207569772E5F7265736574466F63757328293B5C6E2020202020202020207D5C6E202020202020207D295C6E202020202020202E6F6E28276B6579646F776E272C2066756E6374696F6E2865767429207B5C6E20202020202020202020206966202865';
wwv_flow_imp.g_varchar2_table(223) := '76742E6B6579436F6465203D3D3D20242E75692E6B6579436F64652E45534341504529207B5C6E2020202020202020202020202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B5C6E202020202020';
wwv_flow_imp.g_varchar2_table(224) := '20202020207D202020202020202020202020202020205C6E20202020202020202020206576742E73746F7050726F7061676174696F6E28293B5C6E202020202020207D293B5C6E5C6E5C6E20207D2C5C6E5C6E5C6E202064697361626C653A2066756E63';
wwv_flow_imp.g_varchar2_table(225) := '74696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E2020202020696620287569772E5F76616C7565732E64697361626C6564203D3D3D2066616C736529207B5C6E20202020202020207569772E5F6974656D245C6E2020';
wwv_flow_imp.g_varchar2_table(226) := '2020202020202020202E61747472282764697361626C6564272C2764697361626C656427293B5C6E5C6E20202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E5C6E20202020202020202020202E61747472282764697361626C';
wwv_flow_imp.g_varchar2_table(227) := '6564272C2764697361626C656427295C6E20202020202020202020202E756E62696E642827636C69636B272C207569772E5F68616E646C654F70656E436C69636B293B5C6E20202020207D5C6E5C6E20202020207569772E5F76616C7565732E64697361';
wwv_flow_imp.g_varchar2_table(228) := '626C6564203D20747275653B5C6E20207D2C5C6E5C6E5C6E2020656E61626C653A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E2020202020696620287569772E5F76616C7565732E64697361626C65';
wwv_flow_imp.g_varchar2_table(229) := '64203D3D3D207472756529207B5C6E202020202020207569772E5F6974656D242E72656D6F766541747472282764697361626C656427293B5C6E202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E5C6E202020202020202020';
wwv_flow_imp.g_varchar2_table(230) := '202E72656D6F766541747472282764697361626C656427295C6E202020202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69636B293B5C6E5C6E202020202020207569772E';
wwv_flow_imp.g_varchar2_table(231) := '5F76616C7565732E64697361626C6564203D2066616C73653B5C6E20202020207D5C6E20207D5C6E7D293B5C6E225D2C2266696C65223A226A746C5F6974656D2E6A73227D';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(15544487305005980)
,p_plugin_id=>wwv_flow_imp.id(1036953622393257522)
,p_file_name=>'js/jtl_item.js.map'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A0A202A204A544C204974656D2076312E332E30202D20687474703A2F2F617065782E776F726C642F706C7567696E732F0A202A0A202A204C6963656E73656420756E646572204D4954204C6963656E736520284D4954290A202A204A6F7267652052';
wwv_flow_imp.g_varchar2_table(2) := '696D626C617320C2A920323031372D323032300A2A2F0A242E776964676574282275692E6A746C4974656D222C7B6F7074696F6E733A7B6C616E673A22656E222C6C616E675F636F6465733A5B5D2C6D657373616765733A6E756C6C2C6974656D4E616D';
wwv_flow_imp.g_varchar2_table(3) := '653A22222C6669656C6453697A653A33302C6669656C64526F77733A352C6669656C644D61784C656E6774683A38302C6469616C6F675469746C653A6E756C6C7D2C6C6F673A66756E6374696F6E28297B76617220653D41727261792E70726F746F7479';
wwv_flow_imp.g_varchar2_table(4) := '70652E6A6F696E2E63616C6C28617267756D656E74732C222C2022293B617065782E64656275672E6D65737361676528342C226A746C6974656D3A222C65297D2C656C6F673A66756E6374696F6E28652C74297B617065782E64656275672E6D65737361';
wwv_flow_imp.g_varchar2_table(5) := '676528342C226A746C6974656D3A222C652C74297D2C5F746F70417065783A617065782E7574696C2E676574546F704170657828292C5F6372656174655072697661746553746F726167653A66756E6374696F6E28297B746869732E5F6974656D243D24';
wwv_flow_imp.g_varchar2_table(6) := '282223222B746869732E6F7074696F6E732E6974656D4E616D65292C746869732E5F76616C7565733D7B6669656C6453697A653A33302C6669656C644D61784C656E6774683A38302C646174614A534F4E3A7B7D2C637572725F6C616E675F696E646578';
wwv_flow_imp.g_varchar2_table(7) := '3A302C6C616E6775616765733A7B7D2C7461674D61703A7B7D2C6D657373616765733A4A534F4E2E706172736528746869732E6F7074696F6E732E6D65737361676573292C746F74616C4C616E6775616765733A302C64697361626C65643A21312C6E65';
wwv_flow_imp.g_varchar2_table(8) := '775265636F72643A21312C706F707570436C6173733A226A746C6974656D2D6469616C6F67222C706F70757053454C3A226469762E6A746C6974656D2D6469616C6F67222C636F6E74726F6C6C65724D6F64653A746869732E6F7074696F6E732E636F6E';
wwv_flow_imp.g_varchar2_table(9) := '74726F6C6C65724D6F64657D2C746869732E5F656C656D656E74733D7B2477696E646F773A7B7D2C24646F63756D656E743A7B7D2C24626F64793A7B7D2C246974656D7365743A7B7D2C246D6C73427574746F6E3A7B7D2C2469673A7B7D2C2467726964';
wwv_flow_imp.g_varchar2_table(10) := '3A7B7D2C246469616C6F673A7B7D2C246469616C6F67436F6E74656E743A7B7D2C2473617665427574746F6E3A7B7D2C2463616E63656C427574746F6E3A7B7D2C24627574746F6E436F6E7461696E65723A7B7D7D7D2C5F6372656174653A66756E6374';
wwv_flow_imp.g_varchar2_table(11) := '696F6E28297B76617220653D746869732C743D7B7D3B652E6C6F6728225F63726561746522292C652E6C6F6728652E6F7074696F6E732E6974656D4E616D65292C652E5F616464435353546F546F704C6576656C28292C652E5F63726561746550726976';
wwv_flow_imp.g_varchar2_table(12) := '61746553746F7261676528292C652E5F696E6974456C656D656E747328292C652E5F696E697442617365456C656D656E747328293B7472797B652E5F76616C7565732E6C616E6775616765733D4A534F4E2E706172736528652E6F7074696F6E732E6C61';
wwv_flow_imp.g_varchar2_table(13) := '6E675F636F646573297D63617463682874297B636F6E736F6C652E6572726F72282254686520646566696E6564206C616E67756167657320617265206E6F7420666F726D617474656420636F72726563746C792E205365652053686172656420436F6D70';
wwv_flow_imp.g_varchar2_table(14) := '6F6E657473203E20436F6D706F6E656E74732053657474696E6773203E204A544C204974656D205B506C75672D696E5D222C652E6F7074696F6E732E6C616E675F636F646573297D652E5F76616C7565732E746F74616C4C616E6775616765733D652E5F';
wwv_flow_imp.g_varchar2_table(15) := '76616C7565732E6C616E6775616765732E6C656E6774682C652E5F76616C7565732E636F6E74726F6C6C65724D6F6465262621652E656C656D656E742E64617461282276616C756522297C7C28743D652E656C656D656E742E64617461282276616C7565';
wwv_flow_imp.g_varchar2_table(16) := '2229292C652E5F696E6974446174614A534F4E2874292C652E5F76616C7565732E637572725F6C616E675F696E6465783D652E5F6765744C616E6775616765496E64657828652E6F7074696F6E732E6C616E67292C652E5F6974656D242E62696E642822';
wwv_flow_imp.g_varchar2_table(17) := '6368616E6765222C7B7569773A657D2C652E5F73796E634A534F4E64617461292C652E5F656C656D656E74732E24646F63756D656E742E62696E642822617065786265666F7265706167657375626D6974222C7B7569773A657D2C652E5F73796E634A53';
wwv_flow_imp.g_varchar2_table(18) := '4F4E64617461292C652E5F656C656D656E74732E246D6C73427574746F6E2E62696E642822636C69636B222C7B7569773A657D2C652E5F68616E646C654F70656E436C69636B292C652E5F696E6974417065784974656D28292C617065782E6A51756572';
wwv_flow_imp.g_varchar2_table(19) := '792877696E646F77292E6F6E2822696E74657261637469766567726964766965776D6F64656C637265617465222C66756E6374696F6E28742C69297B652E5F696E697447726964436F6E66696728297D297D2C5F696E697447726964436F6E6669673A66';
wwv_flow_imp.g_varchar2_table(20) := '756E6374696F6E28297B76617220653D746869732C743D617065782E726567696F6E2E66696E64436C6F7365737428652E5F6974656D245B305D293B652E6C6F6728225F696E697447726964436F6E66696722292C652E656C6F6728227569772E5F6974';
wwv_flow_imp.g_varchar2_table(21) := '656D24222C652E5F6974656D24292C652E656C6F672822726567696F6E222C74292C652E5F76616C7565732E636F6E74726F6C6C65724D6F64653F28652E5F656C656D656E74732E2469673D742E77696467657428292E696E7465726163746976654772';
wwv_flow_imp.g_varchar2_table(22) := '696428292C652E5F656C656D656E74732E24677269643D742E77696467657428292E696E746572616374697665477269642822676574566965777322292E677269642C652E656C6F6728225F656C656D656E74732E24677269643A222C652E5F656C656D';
wwv_flow_imp.g_varchar2_table(23) := '656E74732E246772696429293A652E6C6F6728226E6F7420616E20494722297D2C5F7265736574466F6375733A66756E6374696F6E28297B76617220653D746869733B696628652E6C6F6728225F7265736574466F63757322292C652E5F76616C756573';
wwv_flow_imp.g_varchar2_table(24) := '2E636F6E74726F6C6C65724D6F6465297472797B76617220743D652E5F656C656D656E74732E24677269642E6D6F64656C2E6765745265636F7264496428652E5F656C656D656E74732E24677269642E76696577242E67726964282267657453656C6563';
wwv_flow_imp.g_varchar2_table(25) := '7465645265636F72647322295B305D292C693D652E5F656C656D656E74732E2469672E696E7465726163746976654772696428226F7074696F6E22292E636F6E6669672E636F6C756D6E732E66696C7465722866756E6374696F6E2874297B7265747572';
wwv_flow_imp.g_varchar2_table(26) := '6E20742E73746174696349643D3D3D652E6F7074696F6E732E6974656D4E616D657D295B305D3B652E5F656C656D656E74732E24677269642E76696577242E677269642822676F746F43656C6C222C742C692E6E616D65292C652E5F656C656D656E7473';
wwv_flow_imp.g_varchar2_table(27) := '2E24677269642E666F63757328297D63617463682865297B636F6E736F6C652E7761726E2822546865726520776572652070726F626C656D7320747279696E6720746F207265666F637573206F6E207468652063656C6C206265696E6720656469746564';
wwv_flow_imp.g_varchar2_table(28) := '22297D656C736520652E5F6974656D242E747269676765722822666F63757322297D2C5F696E6974417065784974656D3A66756E6374696F6E28297B76617220653D746869733B652E6C6F6728225F696E6974417065784974656D222C22526567697374';
wwv_flow_imp.g_varchar2_table(29) := '6572696E67207769746820617065782E6974656D2E63726561746520666F7220222B652E6F7074696F6E732E6974656D4E616D65292C617065782E6974656D2E63726561746528652E6F7074696F6E732E6974656D4E616D652C7B73657456616C75653A';
wwv_flow_imp.g_varchar2_table(30) := '66756E6374696F6E28742C69297B76617220613B652E6C6F672822617065782E6974656D2E73657456616C7565222C742C69292C652E5F696E6974446174614A534F4E284A534F4E2E706172736528747C7C227B7D2229292C652E5F76616C7565732E63';
wwv_flow_imp.g_varchar2_table(31) := '7572725F6C616E675F696E6465783D652E5F6765744C616E6775616765496E64657828652E6F7074696F6E732E6C616E67292C6E756C6C3D3D28613D652E5F676574544C28652E6F7074696F6E732E6C616E672929262628613D697C7C2222292C652E5F';
wwv_flow_imp.g_varchar2_table(32) := '6974656D242E76616C2861297D2C67657456616C75653A66756E6374696F6E28297B72657475726E204A534F4E2E737472696E6769667928652E5F76616C7565732E646174614A534F4E297D2C736574466F6375733A66756E6374696F6E28297B652E5F';
wwv_flow_imp.g_varchar2_table(33) := '6974656D242E747269676765722822666F63757322297D2C656E61626C653A66756E6374696F6E28297B652E656E61626C6528297D2C64697361626C653A66756E6374696F6E28297B652E64697361626C6528297D2C676574506F70757053656C656374';
wwv_flow_imp.g_varchar2_table(34) := '6F723A66756E6374696F6E28297B72657475726E20652E5F76616C7565732E706F70757053454C7D2C2F2A20506C61696E20746578743A204947206573636170657320766961206D657461646174612E6573636170655F6F7574707574203D2074727565';
wwv_flow_imp.g_varchar2_table(35) := '2E202A2F646973706C617956616C7565466F723A66756E6374696F6E2874297B76617220692C612C6E2C6C2C6F3D7B7D3B696628652E6C6F672822617065782E6974656D2E646973706C617956616C7565466F72222C74292C74297472797B6F3D4A534F';
wwv_flow_imp.g_varchar2_table(36) := '4E2E70617273652874297D63617463682865297B7D72657475726E20693D652E5F76616C7565732E646174614A534F4E2C6E3D652E5F76616C7565732E6E65775265636F72642C6C3D652E5F76616C7565732E637572725F6C616E675F696E6465782C65';
wwv_flow_imp.g_varchar2_table(37) := '2E5F696E6974446174614A534F4E286F292C613D652E5F676574544C28652E6F7074696F6E732E6C616E67292C652E5F696E6974446174614A534F4E2869292C652E5F76616C7565732E6E65775265636F72643D6E2C652E5F76616C7565732E63757272';
wwv_flow_imp.g_varchar2_table(38) := '5F6C616E675F696E6465783D6C2C617D7D297D2C5F616464435353546F546F704C6576656C3A66756E6374696F6E28297B69662877696E646F77213D3D77696E646F772E746F70297B76617220653D276C696E6B5B72656C3D227374796C657368656574';
wwv_flow_imp.g_varchar2_table(39) := '225D5B687265662A3D226A746C5F6974656D225D273B303D3D3D746869732E5F746F70417065782E6A51756572792865292E6C656E6774682626746869732E5F746F70417065782E6A517565727928226865616422292E617070656E6428242865292E63';
wwv_flow_imp.g_varchar2_table(40) := '6C6F6E652829297D7D2C5F696E6974456C656D656E74733A66756E6374696F6E28297B746869732E5F656C656D656E74732E2477696E646F773D746869732E5F746F70417065782E6A51756572792877696E646F77292C746869732E5F656C656D656E74';
wwv_flow_imp.g_varchar2_table(41) := '732E24646F63756D656E743D746869732E5F746F70417065782E6A51756572792877696E646F772E746F702E646F63756D656E74292C746869732E5F656C656D656E74732E24626F64793D746869732E5F746F70417065782E6A51756572792877696E64';
wwv_flow_imp.g_varchar2_table(42) := '6F772E746F702E646F63756D656E742E626F6479297D2C5F696E69744469616C6F67456C656D656E74733A66756E6374696F6E28297B746869732E5F656C656D656E74732E246469616C6F67436F6E74656E743D746869732E5F746F70417065782E6A51';
wwv_flow_imp.g_varchar2_table(43) := '7565727928226469762E6A746C6974656D2D636F6E74656E7422292C746869732E5F656C656D656E74732E2473617665427574746F6E3D746869732E5F746F70417065782E6A51756572792822627574746F6E2E6A746C6974656D2D736176652D627574';
wwv_flow_imp.g_varchar2_table(44) := '746F6E22292C746869732E5F656C656D656E74732E2463616E63656C427574746F6E3D746869732E5F746F70417065782E6A51756572792822627574746F6E2E6A746C6974656D2D63616E63656C2D627574746F6E22297D2C5F696E697442617365456C';
wwv_flow_imp.g_varchar2_table(45) := '656D656E74733A66756E6374696F6E28297B76617220653D746869733B652E6C6F6728225F696E697442617365456C656D656E747322292C652E656C6F672822656C656D656E74222C652E656C656D656E74292C652E5F76616C7565732E6669656C6453';
wwv_flow_imp.g_varchar2_table(46) := '697A653D2254455854223D3D3D652E6F7074696F6E732E6974656D547970653F652E5F6974656D242E61747472282273697A6522293A652E5F6974656D242E617474722822636F6C7322292C225445585441524541223D3D3D652E6F7074696F6E732E69';
wwv_flow_imp.g_varchar2_table(47) := '74656D54797065262628652E5F76616C7565732E6669656C64526F77733D652E5F6974656D242E617474722822726F77732229292C652E5F76616C7565732E6669656C644D61784C656E6774683D652E5F6974656D242E6174747228226D61786C656E67';
wwv_flow_imp.g_varchar2_table(48) := '746822292C652E5F656C656D656E74732E246974656D7365743D652E5F6974656D242E706172656E7428292C652E5F656C656D656E74732E246D6C73427574746F6E3D652E5F656C656D656E74732E246974656D7365742E66696E642822627574746F6E';
wwv_flow_imp.g_varchar2_table(49) := '2E6A746C6974656D2D6D6F64616C2D6F70656E22297D2C5F73796E634C616E67756167654D61703A66756E6374696F6E28297B76617220652C743D6E756C6C3B666F7228746869732E6C6F6728225F73796E634C616E67756167654D617022292C653D74';
wwv_flow_imp.g_varchar2_table(50) := '6869732E5F76616C7565732E646174614A534F4E2C746869732E5F76616C7565732E7461674D61703D7B7D2C743D303B652E6C656E6774683E743B742B3D3129746869732E5F76616C7565732E7461674D61705B655B745D2E6C5D3D655B745D2E746C7D';
wwv_flow_imp.g_varchar2_table(51) := '2C5F676574544C3A66756E6374696F6E2865297B72657475726E20746869732E5F76616C7565732E7461674D61705B655D7D2C5F6765744C616E6775616765496E6465783A66756E6374696F6E2865297B76617220743D746869732E5F76616C7565732E';
wwv_flow_imp.g_varchar2_table(52) := '646174614A534F4E2C693D6E756C6C2C613D2D313B666F7228693D303B742E6C656E6774683E6926262D313D3D613B692B3D3129745B695D2E6C3D3D3D65262628613D69293B72657475726E20617D2C5F696E6974446174614A534F4E3A66756E637469';
wwv_flow_imp.g_varchar2_table(53) := '6F6E2865297B76617220743D5B5D2C693D657C7C7B7D3B746869732E6C6F6728225F696E6974446174614A534F4E22292C746869732E656C6F67287B696E7075745F646174613A697D292C617065782E6A51756572792E6973456D7074794F626A656374';
wwv_flow_imp.g_varchar2_table(54) := '2869293F28746869732E6C6F672822496E697469616C697A696E67207769746820656D7074792076616C756522292C746869732E5F76616C7565732E6C616E6775616765732E666F72456163682866756E6374696F6E2865297B742E70757368287B6C3A';
wwv_flow_imp.g_varchar2_table(55) := '652C746C3A22227D297D292C746869732E5F76616C7565732E646174614A534F4E3D742C746869732E5F76616C7565732E6E65775265636F72643D2130293A28746869732E5F76616C7565732E646174614A534F4E3D692C746869732E5F76616C756573';
wwv_flow_imp.g_varchar2_table(56) := '2E6E65775265636F72643D2131292C746869732E5F73796E634C616E67756167654D617028297D2C5F73796E634A534F4E646174613A66756E6374696F6E2865297B76617220743B69662828743D766F69642030213D3D653F652E646174612E7569773A';
wwv_flow_imp.g_varchar2_table(57) := '74686973292E6C6F6728225F73796E634A534F4E6461746122292C742E5F76616C7565732E6E65775265636F726429666F722876617220693D742E5F76616C7565732E746F74616C4C616E6775616765732D313B693E3D303B692D2D29742E5F76616C75';
wwv_flow_imp.g_varchar2_table(58) := '65732E646174614A534F4E5B695D2E746C3D742E5F6974656D242E76616C28293B656C736520742E5F76616C7565732E637572725F6C616E675F696E6465783E3D303F742E5F76616C7565732E646174614A534F4E5B742E5F76616C7565732E63757272';
wwv_flow_imp.g_varchar2_table(59) := '5F6C616E675F696E6465785D2E746C3D742E5F6974656D242E76616C28293A2222213D3D742E5F6974656D242E76616C2829262628742E5F76616C7565732E646174614A534F4E2E70757368287B6C3A742E6F7074696F6E732E6C616E672C746C3A742E';
wwv_flow_imp.g_varchar2_table(60) := '5F6974656D242E76616C28297D292C742E5F76616C7565732E637572725F6C616E675F696E6465783D742E5F76616C7565732E646174614A534F4E2E6C656E6774682D31293B742E5F73796E634C616E67756167654D617028297D2C5F696E6974446961';
wwv_flow_imp.g_varchar2_table(61) := '6C6F67427574746F6E733A66756E6374696F6E28297B746869732E5F656C656D656E74732E2463616E63656C427574746F6E2E62696E642822636C69636B222C7B7569773A746869737D2C746869732E5F68616E646C6543616E63656C427574746F6E43';
wwv_flow_imp.g_varchar2_table(62) := '6C69636B292C746869732E5F656C656D656E74732E2473617665427574746F6E2E62696E642822636C69636B222C7B7569773A746869737D2C746869732E5F68616E646C6553617665427574746F6E436C69636B297D2C5F68616E646C6543616E63656C';
wwv_flow_imp.g_varchar2_table(63) := '427574746F6E436C69636B3A66756E6374696F6E2865297B76617220743D652E646174612E7569773B742E5F76616C7565732E6E65775265636F72643D21312C742E5F656C656D656E74732E246469616C6F672E6469616C6F672822636C6F736522297D';
wwv_flow_imp.g_varchar2_table(64) := '2C5F68616E646C6553617665427574746F6E436C69636B3A66756E6374696F6E2865297B76617220742C693D652E646174612E7569773B692E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E6428222E6A746C6974656D2D76616C';
wwv_flow_imp.g_varchar2_table(65) := '756522292E656163682866756E6374696F6E28652C61297B766172206E3D692E5F6765744C616E6775616765496E64657828612E646174617365742E6C616E67293B6E3E3D303F692E5F76616C7565732E646174614A534F4E5B6E5D2E746C3D612E7661';
wwv_flow_imp.g_varchar2_table(66) := '6C75653A2222213D3D612E76616C75652626692E5F76616C7565732E646174614A534F4E2E70757368287B6C3A612E646174617365742E6C616E672C746C3A612E76616C75657D297D292C692E5F73796E634C616E67756167654D617028292C692E5F76';
wwv_flow_imp.g_varchar2_table(67) := '616C7565732E6E65775265636F72643D21312C692E5F76616C7565732E637572725F6C616E675F696E6465783D692E5F6765744C616E6775616765496E64657828692E6F7074696F6E732E6C616E67292C6E756C6C213D28743D692E5F676574544C2869';
wwv_flow_imp.g_varchar2_table(68) := '2E6F7074696F6E732E6C616E6729292626692E5F6974656D242E76616C2874292C692E5F7369676E616C4368616E676528292C692E5F656C656D656E74732E246469616C6F672E6469616C6F672822636C6F736522297D2C5F7369676E616C4368616E67';
wwv_flow_imp.g_varchar2_table(69) := '653A66756E6374696F6E28297B617065782E6A517565727928746869732E5F6974656D245B305D292E7472696767657228226368616E676522297D2C5F68616E646C654F70656E436C69636B3A66756E6374696F6E2865297B76617220743D652E646174';
wwv_flow_imp.g_varchar2_table(70) := '612E7569773B742E6C6F6728225F68616E646C654F70656E436C69636B22292C742E5F73796E634A534F4E646174612865292C742E5F73686F774469616C6F6728297D2C5F73686F774469616C6F673A66756E6374696F6E28297B76617220652C742C69';
wwv_flow_imp.g_varchar2_table(71) := '2C613D746869733B612E6C6F6728225F73686F774469616C6F6722292C21612E5F76616C7565732E636F6E74726F6C6C65724D6F64652626617065782E6A51756572792E6973456D7074794F626A65637428612E5F656C656D656E74732E246772696429';
wwv_flow_imp.g_varchar2_table(72) := '7C7C28612E6C6F6728227765206469646E277420676574206120686F6C64206F662074686520677269642C206D617962652074727920616761696E22292C612E5F696E697447726964436F6E6669672829292C653D273C7461626C6520636C6173733D22';
wwv_flow_imp.g_varchar2_table(73) := '742D5265706F72742D7265706F7274222073756D6D6172793D22417661696C61626C65205472616E736C6174696F6E73223E5C6E203C74723E5C6E20203C746820636C6173733D22742D5265706F72742D636F6C48656164223E272B612E5F76616C7565';
wwv_flow_imp.g_varchar2_table(74) := '732E6D657373616765732E6C616E67756167654C6162656C2B273C2F74683E20203C746820636C6173733D22742D5265706F72742D636F6C4865616420752D744C223E272B612E5F76616C7565732E6D657373616765732E6C616E677561676556616C75';
wwv_flow_imp.g_varchar2_table(75) := '652B223C2F74683E203C2F74723E5C6E222C242E6561636828612E5F76616C7565732E6C616E6775616765732C66756E6374696F6E28742C69297B766172206E3D612E5F676574544C2869293B6E756C6C3D3D6E2626286E3D2222292C652B3D22203C74';
wwv_flow_imp.g_varchar2_table(76) := '72222B28693D3D3D612E6F7074696F6E732E6C616E673F2720636C6173733D2273656C656374656422273A2222292B273E5C6E20203C746420636C6173733D22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220';
wwv_flow_imp.g_varchar2_table(77) := '752D7443223E272B617065782E7574696C2E65736361706548544D4C417474722869292B273C2F74643E20203C746420636C6173733D22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D744C223E272C22';
wwv_flow_imp.g_varchar2_table(78) := '54455854223D3D3D612E6F7074696F6E732E6974656D547970653F652B3D27202020203C696E70757420747970653D22746578742220636C6173733D22746578745F6669656C6420617065782D6974656D2D74657874206A746C6974656D2D76616C7565';
wwv_flow_imp.g_varchar2_table(79) := '2220646174612D6C616E673D22272B692B27222076616C75653D22272B617065782E7574696C2E65736361706548544D4C41747472286E292B27222073697A653D22272B612E5F76616C7565732E6669656C6453697A652B2722206D61786C656E677468';
wwv_flow_imp.g_varchar2_table(80) := '3D22272B612E5F76616C7565732E6669656C644D61784C656E6774682B27223E3C2F74643E273A652B3D27202020203C746578746172656120636C6173733D22746578746172656120617065782D6974656D2D7465787461726561206A746C6974656D2D';
wwv_flow_imp.g_varchar2_table(81) := '76616C75652220646174612D6C616E673D22272B692B272220636F6C733D22272B612E5F76616C7565732E6669656C6453697A652B272220726F77733D22272B612E5F76616C7565732E6669656C64526F77732B2722206D61786C656E6774683D22272B';
wwv_flow_imp.g_varchar2_table(82) := '612E5F76616C7565732E6669656C644D61784C656E6774682B27223E272B617065782E7574696C2E65736361706548544D4C41747472286E292B223C2F74657874617265613E222C652B3D22203C2F74723E5C6E227D292C652B3D223C2F7461626C653E';
wwv_flow_imp.g_varchar2_table(83) := '5C6E222C693D273C64697620636C6173733D22272B612E5F76616C7565732E706F707570436C6173732B27223E3C64697620636C6173733D226A746C6974656D2D636F6E7461696E65722075692D776964676574223E5C6E20203C64697620636C617373';
wwv_flow_imp.g_varchar2_table(84) := '3D226A746C6974656D2D627574746F6E2D636F6E7461696E6572223E5C6E20202020203C627574746F6E20636C6173733D226A746C6974656D2D63616E63656C2D627574746F6E20742D427574746F6E223E202020202020203C7370616E20636C617373';
wwv_flow_imp.g_varchar2_table(85) := '3D22742D427574746F6E2D6C6162656C223E272B612E5F76616C7565732E6D657373616765732E63616E63656C427574746F6E2B273C2F7370616E3E20202020203C2F627574746F6E3E5C6E20202020203C627574746F6E20636C6173733D226A746C69';
wwv_flow_imp.g_varchar2_table(86) := '74656D2D736176652D627574746F6E20742D427574746F6E20742D427574746F6E2D2D686F74223E202020202020203C7370616E20636C6173733D22742D427574746F6E2D6C6162656C223E272B612E5F76616C7565732E6D657373616765732E617070';
wwv_flow_imp.g_varchar2_table(87) := '6C794368616E6765732B273C2F7370616E3E202020202020203C7370616E20636C6173733D22742D49636F6E20742D49636F6E2D2D72696768742066612066612D636865636B223E3C2F7370616E3E20202020203C2F627574746F6E3E5C6E20203C2F64';
wwv_flow_imp.g_varchar2_table(88) := '69763E5C6E20203C64697620636C6173733D226A746C6974656D2D636F6E74656E74223E5C6E272B652B2220203C2F6469763E5C6E3C2F6469763E3C2F6469763E5C6E222C612E5F656C656D656E74732E24626F64792E617070656E642869292C612E5F';
wwv_flow_imp.g_varchar2_table(89) := '656C656D656E74732E246469616C6F673D612E5F746F70417065782E6A517565727928612E5F76616C7565732E706F70757053454C292C743D77696E646F773D3D3D77696E646F772E746F703F7B6D793A226C656674222C61743A226C6566742063656E';
wwv_flow_imp.g_varchar2_table(90) := '746572222C6F663A612E5F6974656D245B305D7D3A7B6D793A2263656E7465722063656E746572222C61743A2263656E7465722063656E746572222C6F663A612E5F746F70417065782E6A517565727928222E75692D6469616C6F6722295B305D7D2C61';
wwv_flow_imp.g_varchar2_table(91) := '2E5F656C656D656E74732E246469616C6F672E6469616C6F67287B636C6F73654F6E4573636170653A21302C7469746C653A612E6F7074696F6E732E6469616C6F675469746C652C6175746F526573697A653A21302C6D696E57696474683A3430302C6D';
wwv_flow_imp.g_varchar2_table(92) := '696E4865696768743A3235302C77696474683A226175746F222C6865696768743A226175746F222C6D6F64616C3A21302C6469616C6F67436C6173733A2275692D6469616C6F67222C706F736974696F6E3A742C6F70656E3A66756E6374696F6E28297B';
wwv_flow_imp.g_varchar2_table(93) := '612E5F696E69744469616C6F67456C656D656E747328292C612E5F696E69744469616C6F67427574746F6E7328292C612E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E64282274722E73656C6563746564202E6A746C6974656D';
wwv_flow_imp.g_varchar2_table(94) := '2D76616C756522292E747269676765722822666F63757322297D2C636C6F73653A66756E6374696F6E28297B612E5F656C656D656E74732E246469616C6F672E72656D6F766528292C612E5F656C656D656E74732E24646F63756D656E742E66696E6428';
wwv_flow_imp.g_varchar2_table(95) := '612E5F76616C7565732E706F70757053454C292E72656D6F766528292C612E5F7265736574466F63757328297D7D292E6F6E28226B6579646F776E222C66756E6374696F6E2865297B652E6B6579436F64653D3D3D242E75692E6B6579436F64652E4553';
wwv_flow_imp.g_varchar2_table(96) := '434150452626612E5F656C656D656E74732E246469616C6F672E6469616C6F672822636C6F736522292C652E73746F7050726F7061676174696F6E28297D297D2C64697361626C653A66756E6374696F6E28297B21313D3D3D746869732E5F76616C7565';
wwv_flow_imp.g_varchar2_table(97) := '732E64697361626C6564262628746869732E5F6974656D242E61747472282264697361626C6564222C2264697361626C656422292C746869732E5F656C656D656E74732E246D6C73427574746F6E2E61747472282264697361626C6564222C2264697361';
wwv_flow_imp.g_varchar2_table(98) := '626C656422292E756E62696E642822636C69636B222C746869732E5F68616E646C654F70656E436C69636B29292C746869732E5F76616C7565732E64697361626C65643D21307D2C656E61626C653A66756E6374696F6E28297B21303D3D3D746869732E';
wwv_flow_imp.g_varchar2_table(99) := '5F76616C7565732E64697361626C6564262628746869732E5F6974656D242E72656D6F766541747472282264697361626C656422292C746869732E5F656C656D656E74732E246D6C73427574746F6E2E72656D6F766541747472282264697361626C6564';
wwv_flow_imp.g_varchar2_table(100) := '22292E62696E642822636C69636B222C7B7569773A746869737D2C746869732E5F68616E646C654F70656E436C69636B292C746869732E5F76616C7565732E64697361626C65643D2131297D7D293B';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(15544048515005970)
,p_plugin_id=>wwv_flow_imp.id(1036953622393257522)
,p_file_name=>'js/jtl_item.min.js'
,p_mime_type=>'application/x-javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
