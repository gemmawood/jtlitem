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
,p_release=>'26.1.2'
,p_default_workspace_id=>10000
,p_default_application_id=>9107
,p_default_id_offset=>0
,p_default_owner=>'CAVPROD'
);
end;
/
 
prompt APPLICATION 9107 - JTL Item Translation Demo
--
-- Application Export:
--   Application:     9107
--   Name:            JTL Item Translation Demo
--   Exported By:     CAV_AI_DEV
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                      9
--       Items:                   25
--       Validations:              1
--       Processes:               13
--       Regions:                 21
--       Buttons:                 15
--       Dynamic Actions:          3
--     Shared Components:
--       Logic:
--         Items:                  2
--         Processes:              1
--         Build Options:          1
--       Navigation:
--         Lists:                  2
--         Breadcrumbs:            1
--           Entries:              6
--       Security:
--         Authentication:         1
--       User Interface:
--         Themes:                 1
--         Templates:
--         Shortcuts:              1
--         Plug-ins:               1
--       PWA:
--       Globalization:
--       Reports:
--       E-Mail:
--     Supporting Objects:  Included
--       Install scripts:          2
--   Version:         26.1.2
--   Instance ID:     203769285900703
--

prompt --application/delete_application
begin
wwv_flow_imp.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/create_application
begin
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'CAVPROD')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'JTL Item Translation Demo')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'JTL9107')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'C34545BD59D4D04C0A37C3A9864990179C78735EFCA848CFF2CAFE2F36B9E9FF'
,p_bookmark_checksum_function=>'SH512'
,p_accept_old_checksums=>false
,p_compatibility_mode=>'26.1'
,p_accessible_read_only=>'N'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'SESSION'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix=>nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(477553353070001991)
,p_populate_roles=>'A'
,p_application_tab_set=>0
,p_logo_type=>'T'
,p_logo_text=>'Translation Demo'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_referrer_policy=>'strict-origin-when-cross-origin'
,p_pass_ecid=>'N'
,p_authorize_batch_job=>'N'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_tokenize_row_search=>'N'
,p_friendly_url=>'N'
,p_modernization_available=>'Y'
,p_substitution_string_01=>'EDIT_BUTTON'
,p_substitution_value_01=>'<i class="fa fa-pencil-square-o fa-2x"></i>'
,p_file_prefix=>nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>2461271101421
,p_version_scn=>'4894524242'
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'N'
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.'
,p_login_url=>'f?p=&APP_ID.:LOGIN_DESKTOP:&SESSION.::&DEBUG.'
,p_theme_style_by_user_pref=>false
,p_navigation_list_id=>wwv_flow_imp.id(477510798740001773)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>2469215554099805162
,p_nav_list_template_options=>'#DEFAULT#'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(477553067079001952)
,p_nav_bar_list_template_id=>2849019392706229583
,p_nav_bar_template_options=>'#DEFAULT#'
,p_translation_method=>'TRANSLATION_APPS'
);
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
,p_image_prefix=>nvl(wwv_flow_application_install.get_static_plugin_file_prefix('ITEM TYPE','JMR.MLS.JTLITEM'),'&G_APEX_NITRO_IMAGES.')
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
'  l_messages                gt_string := p_plugin.attribute_02; -- for MLS messages',
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
'  apex_debug.message(''p_item.attribute_01 (Default language): %s'', p_item.attribute_01);',
'  apex_debug.message(''p_item.attribute_02 (Edit languages): %s'', p_item.attribute_02);',
'  apex_debug.message(''p_item.attribute_03 (Item Type): %s'', p_item.attribute_03);',
'',
'  l_default_language := coalesce(apex_plugin_util.replace_substitutions(p_item.attribute_01)',
'                               , apex_util.get_session_lang);',
'  l_edit_languages := apex_plugin_util.get_plsql_func_result_boolean(p_item.attribute_02);',
'  l_languages_list := apex_plugin_util.get_plsql_function_result(p_plugin.attribute_01); -- Enabled Language List',
'  l_item_type := coalesce(p_item.attribute_03, ''TEXT'');',
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
'  p_result.escape_output := false;',
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
'  l_default_language := coalesce(apex_plugin_util.replace_substitutions(p_item.attribute_01)',
'                               , apex_util.get_session_lang);',
'  l_languages_list := apex_plugin_util.get_plsql_function_result(p_plugin.attribute_01); -- Enabled Language List',
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
,p_api_version=>2
,p_render_function=>'render'
,p_meta_data_function=>'metadata'
,p_validation_function=>'validate'
,p_item_session_state_data_type=>'VARCHAR2'
,p_standard_attributes=>'VISIBLE:FORM_ELEMENT:SESSION_STATE:READONLY:ESCAPE_OUTPUT:QUICKPICK:SOURCE:ELEMENT:WIDTH:HEIGHT:PLACEHOLDER'
,p_substitute_attributes=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Plugin for storing multi-language translations (MLS) in a JSON column.',
'',
'For better plugin render performance switch from the inline code to the package code.  Change the render, metadata, and validate procedures to tk_jtl_plugin.render, tk_jtl_plugin.metadata and tk_jtl_plugin.validate. Then REMOVE the inline code or you'
||' will not get the performance improvement.'))
,p_version_identifier=>'2.0.0'
,p_about_url=>'https://github.com/rimblas/jtlitem'
,p_files_version=>2461271101422
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
wwv_flow_imp.g_varchar2_table(1) := '627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E207B0A202070616464696E673A202E3472656D202E3872656D3B0A20206F726465723A20333B0A7D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C617267652062757474';
wwv_flow_imp.g_varchar2_table(2) := '6F6E2E6A746C6974656D2D6D6F64616C2D6F70656E2E612D427574746F6E207B0A2020202070616464696E673A202E3872656D202E3972656D3B0A7D0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C6172676520627574746F6E2E6A';
wwv_flow_imp.g_varchar2_table(3) := '746C6974656D2D6D6F64616C2D6F70656E2E612D427574746F6E207B0A2020202070616464696E673A20312E3272656D3B0A7D0A0A0A2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C202E742D466F726D2D';
wwv_flow_imp.g_varchar2_table(4) := '6974656D57726170706572207B0A20202020616C69676E2D6974656D733A20737472657463683B0A2020202077696474683A20313030253B0A7D0A0A2E6A746C6974656D2D636F6E74656E74207B0A20206D617267696E3A203020313070783B0A7D0A2E';
wwv_flow_imp.g_varchar2_table(5) := '6A746C6974656D2D636F6E74656E74207461626C65207B0A20206D617267696E3A203130707820303B0A7D0A2E6A746C6974656D2D636F6E74656E74207461626C652074722E73656C6563746564207B0A20206F75746C696E653A203170782064617368';
wwv_flow_imp.g_varchar2_table(6) := '6564206F72616E67653B0A7D0A2E6A746C6974656D2D636F6E74656E74207461626C652074722E73656C65637465642074647B0A20206261636B67726F756E642D636F6C6F723A20236637663762613B0A7D0A2E6A746C6974656D2D627574746F6E2D63';
wwv_flow_imp.g_varchar2_table(7) := '6F6E7461696E6572202E75692D69636F6E207B0A2020646973706C61793A20696E6C696E652D626C6F636B3B0A7D0A2E6A746C6974656D2D627574746F6E2D636F6E7461696E6572207B0A202070616464696E673A2035707820313070783B0A2020706F';
wwv_flow_imp.g_varchar2_table(8) := '736974696F6E3A2072656C61746976653B0A2020666C6F61743A2072696768743B0A7D0A0A0A2F2A2320736F757263654D617070696E6755524C3D6A746C5F6974656D2E6373732E6D6170202A2F0A';
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
wwv_flow_imp.g_varchar2_table(1) := '7B2276657273696F6E223A332C22736F7572636573223A5B226A746C5F6974656D2E637373225D2C226E616D6573223A5B5D2C226D617070696E6773223A22414141413B454143452C6F4241416F423B45414370422C514141513B414143563B41414341';
wwv_flow_imp.g_varchar2_table(2) := '3B494143492C6F4241416F423B41414378423B414143413B494143492C654141653B4141436E423B3B3B414147413B494143492C6F4241416F423B49414370422C574141573B414143663B3B414145413B454143452C634141633B41414368423B414143';
wwv_flow_imp.g_varchar2_table(3) := '413B454143452C634141633B41414368423B414143413B454143452C3042414130423B41414335423B414143413B454143452C7942414179423B41414333423B414143413B454143452C7142414171423B41414376423B414143413B454143452C694241';
wwv_flow_imp.g_varchar2_table(4) := '4169423B4541436A422C6B4241416B423B4541436C422C594141593B41414364222C2266696C65223A226A746C5F6974656D2E637373222C22736F7572636573436F6E74656E74223A5B22627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E';
wwv_flow_imp.g_varchar2_table(5) := '207B5C6E202070616464696E673A202E3472656D202E3872656D3B5C6E20206F726465723A20333B5C6E7D5C6E2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C6172676520627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E';
wwv_flow_imp.g_varchar2_table(6) := '2E612D427574746F6E207B5C6E2020202070616464696E673A202E3872656D202E3972656D3B5C6E7D5C6E2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C6172676520627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E2E';
wwv_flow_imp.g_varchar2_table(7) := '612D427574746F6E207B5C6E2020202070616464696E673A20312E3272656D3B5C6E7D5C6E5C6E5C6E2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C202E742D466F726D2D6974656D57726170706572207B';
wwv_flow_imp.g_varchar2_table(8) := '5C6E20202020616C69676E2D6974656D733A20737472657463683B5C6E2020202077696474683A20313030253B5C6E7D5C6E5C6E2E6A746C6974656D2D636F6E74656E74207B5C6E20206D617267696E3A203020313070783B5C6E7D5C6E2E6A746C6974';
wwv_flow_imp.g_varchar2_table(9) := '656D2D636F6E74656E74207461626C65207B5C6E20206D617267696E3A203130707820303B5C6E7D5C6E2E6A746C6974656D2D636F6E74656E74207461626C652074722E73656C6563746564207B5C6E20206F75746C696E653A20317078206461736865';
wwv_flow_imp.g_varchar2_table(10) := '64206F72616E67653B5C6E7D5C6E2E6A746C6974656D2D636F6E74656E74207461626C652074722E73656C65637465642074647B5C6E20206261636B67726F756E642D636F6C6F723A20236637663762613B5C6E7D5C6E2E6A746C6974656D2D62757474';
wwv_flow_imp.g_varchar2_table(11) := '6F6E2D636F6E7461696E6572202E75692D69636F6E207B5C6E2020646973706C61793A20696E6C696E652D626C6F636B3B5C6E7D5C6E2E6A746C6974656D2D627574746F6E2D636F6E7461696E6572207B5C6E202070616464696E673A20357078203130';
wwv_flow_imp.g_varchar2_table(12) := '70783B5C6E2020706F736974696F6E3A2072656C61746976653B5C6E2020666C6F61743A2072696768743B5C6E7D5C6E5C6E225D7D';
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
wwv_flow_imp.g_varchar2_table(1) := '627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E7B70616464696E673A2E3472656D202E3872656D3B6F726465723A337D2E742D466F726D2D6669656C64436F6E7461696E65722D2D6C6172676520627574746F6E2E6A746C6974656D2D6D';
wwv_flow_imp.g_varchar2_table(2) := '6F64616C2D6F70656E2E612D427574746F6E7B70616464696E673A2E3872656D202E3972656D7D2E742D466F726D2D6669656C64436F6E7461696E65722D2D786C6172676520627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E2E612D4275';
wwv_flow_imp.g_varchar2_table(3) := '74746F6E7B70616464696E673A312E3272656D7D2E742D466F726D2D6669656C64436F6E7461696E65722D2D666C6F6174696E674C6162656C202E742D466F726D2D6974656D577261707065727B616C69676E2D6974656D733A737472657463683B7769';
wwv_flow_imp.g_varchar2_table(4) := '6474683A313030257D2E6A746C6974656D2D636F6E74656E747B6D617267696E3A3020313070787D2E6A746C6974656D2D636F6E74656E74207461626C657B6D617267696E3A3130707820307D2E6A746C6974656D2D636F6E74656E74207461626C6520';
wwv_flow_imp.g_varchar2_table(5) := '74722E73656C65637465647B6F75746C696E653A31707820646173686564206F72616E67657D2E6A746C6974656D2D636F6E74656E74207461626C652074722E73656C65637465642074647B6261636B67726F756E642D636F6C6F723A23663766376261';
wwv_flow_imp.g_varchar2_table(6) := '7D2E6A746C6974656D2D627574746F6E2D636F6E7461696E6572202E75692D69636F6E7B646973706C61793A696E6C696E652D626C6F636B7D2E6A746C6974656D2D627574746F6E2D636F6E7461696E65727B70616464696E673A35707820313070783B';
wwv_flow_imp.g_varchar2_table(7) := '706F736974696F6E3A72656C61746976653B666C6F61743A72696768747D';
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
wwv_flow_imp.g_varchar2_table(19) := '6522293B0A202020207569772E6C6F67287569772E6F7074696F6E732E6974656D4E616D65293B0A0A202020207569772E5F616464435353546F546F704C6576656C28293B0A0A202020202F2F2068656C7065722066756E6374696F6E20666F72206669';
wwv_flow_imp.g_varchar2_table(20) := '6E64696E672074686520696E64657820706F736974696F6E206F66206F75722063757272656E7420646973706C61796564206C616E67756167650A2020202066756E6374696F6E206C616E67756167655F696E64657820286A2C206C29207B0A20202020';
wwv_flow_imp.g_varchar2_table(21) := '20207661722069203D206E756C6C2C0A20202020202020202020696478203D202D313B0A202020202020666F72202869203D20303B206A2E6C656E677468203E206920262620696478203D3D202D313B2069202B3D203129207B0A202020202020202069';
wwv_flow_imp.g_varchar2_table(22) := '6620286A5B695D2E6C203D3D3D206C29207B0A20202020202020202020696478203D20693B0A20202020202020207D0A2020202020207D0A20202020202072657475726E206964783B0A202020207D0A0A202020207569772E5F63726561746550726976';
wwv_flow_imp.g_varchar2_table(23) := '61746553746F7261676528293B0A202020207569772E5F696E6974456C656D656E747328293B0A202020207569772E5F696E697442617365456C656D656E747328293B0A0A0A20202020747279207B7569772E5F76616C7565732E6C616E677561676573';
wwv_flow_imp.g_varchar2_table(24) := '203D204A534F4E2E7061727365287569772E6F7074696F6E732E6C616E675F636F646573293B7D0A20202020636174636820286529207B636F6E736F6C652E6572726F72282254686520646566696E6564206C616E67756167657320617265206E6F7420';
wwv_flow_imp.g_varchar2_table(25) := '666F726D617474656420636F72726563746C792E205365652053686172656420436F6D706F6E657473203E20436F6D706F6E656E74732053657474696E6773203E204A544C204974656D205B506C75672D696E5D222C207569772E6F7074696F6E732E6C';
wwv_flow_imp.g_varchar2_table(26) := '616E675F636F646573293B7D0A202020207569772E5F76616C7565732E746F74616C4C616E677561676573203D207569772E5F76616C7565732E6C616E6775616765732E6C656E6774683B0A0A2020202069662028217569772E5F76616C7565732E636F';
wwv_flow_imp.g_varchar2_table(27) := '6E74726F6C6C65724D6F6465207C7C207569772E656C656D656E742E64617461282276616C756522292029207B0A2020202020202F2F2057652061726520616E206E6F7420616E20494720636F6C756D6E20287768657265207468652076616C75652069';
wwv_flow_imp.g_varchar2_table(28) := '73207365742076696120646973706C617956616C7565466F7229200A2020202020202F2F206F722077652061726520616E206974656D207769746820616E20696E697469616C2076616C75650A202020202020696E69744A534F4E203D207569772E656C';
wwv_flow_imp.g_varchar2_table(29) := '656D656E742E64617461282276616C756522293B0A202020207D0A0A202020202F2F2073657420746865206672657368206C697374206F66206C616E6775616765730A202020207569772E5F696E6974446174614A534F4E28696E69744A534F4E293B0A';
wwv_flow_imp.g_varchar2_table(30) := '0A202020202F2F20576869636820706F736974696F6E206C616E677561676520617265207765207573696E670A202020207569772E5F76616C7565732E637572725F6C616E675F696E646578203D206C616E67756167655F696E646578287569772E5F76';
wwv_flow_imp.g_varchar2_table(31) := '616C7565732E646174614A534F4E2C207569772E6F7074696F6E732E6C616E67293B0A202020200A202020202F2F2053796E63206F7572204A534F4E20646174612D76616C7565206174747269627574652077697468207468652061637475616C207661';
wwv_flow_imp.g_varchar2_table(32) := '6C756520696E2074686520636F7272656374206C616E67756167652C206275740A202020202F2F20616C736F20647572696E672070616765207375626D697420746F206D616B652073757265207765207375626D69742074686520636F72726563742076';
wwv_flow_imp.g_varchar2_table(33) := '616C7565200A202020207569772E5F6974656D240A202020202020202E62696E6428276368616E6765272C207B7569773A207569777D2C207569772E5F73796E634A534F4E64617461293B0A202020207569772E5F656C656D656E74732E24646F63756D';
wwv_flow_imp.g_varchar2_table(34) := '656E740A202020202020202E62696E642827617065786265666F7265706167657375626D6974272C207B7569773A207569777D2C207569772E5F73796E634A534F4E64617461293B0A0A202020207569772E5F656C656D656E74732E246D6C7342757474';
wwv_flow_imp.g_varchar2_table(35) := '6F6E0A202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69636B293B0A0A202020202F2F20496E6974204150455820706167656974656D2066756E6374696F6E730A202020';
wwv_flow_imp.g_varchar2_table(36) := '207569772E5F696E6974417065784974656D28293B0A0A202020202F2F20617065782E6A51756572792877696E646F77292E6F6E28227468656D6534327265616479222C2066756E6374696F6E2829207B0A20202020617065782E6A5175657279287769';
wwv_flow_imp.g_varchar2_table(37) := '6E646F77292E6F6E2822696E74657261637469766567726964766965776D6F64656C637265617465222C2066756E6374696F6E286576656E742C20756929207B202F2F2077696C6C207468697320776F726B20666F72206D756C7469706C652049473F0A';
wwv_flow_imp.g_varchar2_table(38) := '2020202020202F2F20696E69742074686520677269642076616C7565732C20627574207761697420756E74696C2074686520677269642069732072656164790A2020202020207569772E5F696E697447726964436F6E66696728293B0A202020207D293B';
wwv_flow_imp.g_varchar2_table(39) := '0A0A20207D2C0A0A0A20205F696E697447726964436F6E6669673A2066756E6374696F6E202829207B0A2020202076617220756977203D20746869732C0A2020202020202020726567696F6E203D20617065782E726567696F6E2E66696E64436C6F7365';
wwv_flow_imp.g_varchar2_table(40) := '7374287569772E5F6974656D245B305D293B0A0A202020207569772E6C6F6728225F696E697447726964436F6E66696722293B0A202020207569772E656C6F6728227569772E5F6974656D24222C207569772E5F6974656D24293B0A202020207569772E';
wwv_flow_imp.g_varchar2_table(41) := '656C6F672822726567696F6E222C20726567696F6E293B0A0A20202020696620287569772E5F76616C7565732E636F6E74726F6C6C65724D6F646529207B0A2020202020202F2F207569772E5F656C656D656E74732E2467726964203D20726567696F6E';
wwv_flow_imp.g_varchar2_table(42) := '2E77696467657428292E696E74657261637469766547726964282267657443757272656E745669657722293B0A2020202020207569772E5F656C656D656E74732E246967203D20726567696F6E2E77696467657428292E696E7465726163746976654772';
wwv_flow_imp.g_varchar2_table(43) := '696428293B0A2020202020207569772E5F656C656D656E74732E2467726964203D20726567696F6E2E77696467657428292E696E746572616374697665477269642822676574566965777322292E677269643B0A2020202020207569772E656C6F672822';
wwv_flow_imp.g_varchar2_table(44) := '5F656C656D656E74732E24677269643A222C207569772E5F656C656D656E74732E2467726964293B0A0A2F2A0A202020202020726567696F6E2E77696467657428292E6F6E2822696E7465726163746976656772696473617665222C2066756E6374696F';
wwv_flow_imp.g_varchar2_table(45) := '6E2829207B0A20202020202020202F2F20576F756C64206C696B6520746F2063616C6C20636C65617253656C656374696F6E282920696E73746561642C206275742063616E277420666967757265206F757420686F772E0A20202020202020202F2F2054';
wwv_flow_imp.g_varchar2_table(46) := '75726E2065646974206F666620746F20666F7263652061206672657368206C6F6164206F66206461746120616761696E2E0A20202020202020202F2F205965732C2074686973206973206120746F74616C206861636B2C20616E6420776F756C64206C6F';
wwv_flow_imp.g_varchar2_table(47) := '766520746F206C6561726E206F6620612062657474657220617070726F6163680A20202020202020207569772E5F656C656D656E74732E24677269642E736574456469744D6F64652866616C7365293B0A2020202020207D293B0A2A2F0A0A202020207D';
wwv_flow_imp.g_varchar2_table(48) := '0A20202020656C7365207B0A2020202020207569772E6C6F6728226E6F7420616E20494722293B0A202020207D0A0A20207D2C0A0A0A20205F7265736574466F6375733A2066756E6374696F6E202829207B0A2020202076617220756977203D20746869';
wwv_flow_imp.g_varchar2_table(49) := '733B0A0A202020207569772E6C6F6728225F7265736574466F63757322293B0A0A20202020696620287569772E5F76616C7565732E636F6E74726F6C6C65724D6F646529207B20202F2F2061726520776520696E73696465206120677269643F0A202020';
wwv_flow_imp.g_varchar2_table(50) := '2020202F2F2053696E63652077652068617665206120617065782E6974656D28292E676574506F70757053656C6563746F72207468697320636F6465206973207265616C6C79206E6F74206E65636573736172790A2020202020202F2F20627574206974';
wwv_flow_imp.g_varchar2_table(51) := '207365656D7320746F2070726F766964652061206D75636820626574746572207573657220657870657269656E636520626563617365206F6E63652074686520706F70757020636C6F7365730A2020202020202F2F207765277265206261636B20656469';
wwv_flow_imp.g_varchar2_table(52) := '74696E67207468652063656C6C206173206F70706F73656420746F20686176696E6720746F20666F726365207468652065646974696E672E0A0A2020202020202F2F207569772E656C6F6728227569772E5F656C656D656E74732E2467726964222C2075';
wwv_flow_imp.g_varchar2_table(53) := '69772E5F656C656D656E74732E2467726964293B0A2020202020202F2F207569772E656C6F6728227569772E5F656C656D656E74732E246967222C207569772E5F656C656D656E74732E246967293B0A0A202020202020747279207B0A20202020202020';
wwv_flow_imp.g_varchar2_table(54) := '202F2F2066696E64206F757220636F6C756D6E20696E2074686520677269640A20202020202020202F2F205468616E6B20796F7520746F204D656E6E6F20486F6F67656E64696A6B20666F7220706F7274696F6E73206F66207468697320636F64650A20';
wwv_flow_imp.g_varchar2_table(55) := '202020202020202F2F2068747470733A2F2F6769746875622E636F6D2F6D656E6E6F6F6F2F6F72636C617065782D6D6F64616C2D6C6F760A0A2020202020202020766172207265636F72644964203D207569772E5F656C656D656E74732E24677269642E';
wwv_flow_imp.g_varchar2_table(56) := '6D6F64656C2E6765745265636F72644964287569772E5F656C656D656E74732E24677269642E76696577242E67726964282767657453656C65637465645265636F72647327295B305D293B0A202020202020202076617220636F6C756D6E203D20756977';
wwv_flow_imp.g_varchar2_table(57) := '2E5F656C656D656E74732E2469672E696E7465726163746976654772696428276F7074696F6E27292E636F6E6669672E636F6C756D6E732E66696C7465722866756E6374696F6E2028636F6C756D6E29207B0A2020202020202020202072657475726E20';
wwv_flow_imp.g_varchar2_table(58) := '636F6C756D6E2E7374617469634964203D3D3D207569772E6F7074696F6E732E6974656D4E616D653B0A20202020202020207D295B305D3B0A20202020202020202F2F20676F20746F206F75722063656C6C20616E6420666F6375732069742020202020';
wwv_flow_imp.g_varchar2_table(59) := '200A20202020202020207569772E5F656C656D656E74732E24677269642E76696577242E677269642827676F746F43656C6C272C207265636F726449642C20636F6C756D6E2E6E616D65293B0A20202020202020207569772E5F656C656D656E74732E24';
wwv_flow_imp.g_varchar2_table(60) := '677269642E666F63757328293B0A2020202020207D0A202020202020636174636820286529207B0A2020202020202020636F6E736F6C652E7761726E2822546865726520776572652070726F626C656D7320747279696E6720746F207265666F63757320';
wwv_flow_imp.g_varchar2_table(61) := '6F6E207468652063656C6C206265696E672065646974656422293B0A2020202020207D0A0A202020207D20656C7365207B0A2020202020202F2F20776520617265206E6F7420696E206120677269642C20736F20666F63757320746865206974656D2074';
wwv_flow_imp.g_varchar2_table(62) := '6861742063616C6C65642075730A2020202020207569772E5F6974656D242E747269676765722827666F63757327293B0A202020207D0A20207D2C0A0A0A0A0A20205F696E6974417065784974656D3A2066756E6374696F6E202829207B0A2020202076';
wwv_flow_imp.g_varchar2_table(63) := '617220756977203D20746869733B0A0A202020207569772E6C6F6728225F696E6974417065784974656D222C20225265676973746572696E67207769746820617065782E6974656D2E63726561746520666F722022202B207569772E6F7074696F6E732E';
wwv_flow_imp.g_varchar2_table(64) := '6974656D4E616D65293B0A202020202F2F2053657420616E64206765742076616C75652076696120617065782066756E6374696F6E730A20202020617065782E6974656D2E637265617465287569772E6F7074696F6E732E6974656D4E616D652C207B0A';
wwv_flow_imp.g_varchar2_table(65) := '0A2020202020202073657456616C75653A2066756E6374696F6E287056616C75652C2070446973706C617956616C756529207B0A202020202020202020207569772E6C6F67282022617065782E6974656D2E73657456616C7565222C207056616C75652C';
wwv_flow_imp.g_varchar2_table(66) := '2070446973706C617956616C7565293B0A0A202020202020202020207569772E5F696E6974446174614A534F4E284A534F4E2E7061727365287056616C7565207C7C20227B7D2229293B0A0A202020202020202020206966202870446973706C61795661';
wwv_flow_imp.g_varchar2_table(67) := '6C7565207C7C20217056616C7565207C7C207056616C75652E6C656E677468203D3D3D203029207B0A20202020202020202020202020202F2F20656D707479207056616C75652C2077652073686F756C6420626520646F6E650A20202020202020202020';
wwv_flow_imp.g_varchar2_table(68) := '202020207569772E5F6974656D242E76616C28293B0A202020202020202020207D20656C7365207B0A20202020202020202020202020202F2F204E4F5420656D707479207056616C75650A2020202020202020202020202020696620282170446973706C';
wwv_flow_imp.g_varchar2_table(69) := '617956616C756529207B0A2020202020202020202020202020202070446973706C617956616C7565203D207569772E5F676574544C287569772E6F7074696F6E732E6C616E67293B0A20202020202020202020202020207D0A0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(70) := '202020207569772E5F6974656D242E76616C2870446973706C617956616C7565293B0A202020202020202020207D0A0A202020202020207D2C0A2020202020202067657456616C75653A2066756E6374696F6E2829207B0A202020202020202020207265';
wwv_flow_imp.g_varchar2_table(71) := '7475726E204A534F4E2E737472696E67696679287569772E5F76616C7565732E646174614A534F4E293B0A202020202020207D2C0A20202020202020736574466F6375733A2066756E6374696F6E2829207B0A202020202020202020207569772E5F6974';
wwv_flow_imp.g_varchar2_table(72) := '656D242E747269676765722822666F63757322293B0A202020202020207D2C0A20202020202020656E61626C653A2066756E6374696F6E2829207B0A202020202020202020207569772E656E61626C6528293B0A202020202020207D2C0A202020202020';
wwv_flow_imp.g_varchar2_table(73) := '2064697361626C653A2066756E6374696F6E2829207B0A202020202020202020207569772E64697361626C6528293B0A202020202020207D2C0A20202020202020676574506F70757053656C6563746F723A2066756E6374696F6E2829207B0A20202020';
wwv_flow_imp.g_varchar2_table(74) := '20202020202072657475726E207569772E5F76616C7565732E706F70757053454C3B0A202020202020207D2C0A20202020202020646973706C617956616C7565466F723A2066756E6374696F6E20287056616C756529207B0A2020202020202020202076';
wwv_flow_imp.g_varchar2_table(75) := '617220707265766A746C4A534F4E203D207B7D2C0A20202020202020202020202020206A746C4A534F4E203D207B7D2C0A202020202020202020202020202072657475726E56616C75653B0A202020202020202020202F2F205468652049472063616C6C';
wwv_flow_imp.g_varchar2_table(76) := '73207468697320636F646520746F207365742074686520696E697469616C20646973706C61792076616C7565730A202020202020202020207569772E6C6F672822617065782E6974656D2E646973706C617956616C7565466F72222C207056616C756529';
wwv_flow_imp.g_varchar2_table(77) := '3B0A20202020202020202020696620287056616C756529207B0A202020202020202020202020747279207B202F2F206A7573742070726F7465637420757320696620746865204A534F4E20697320696E76616C69640A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(78) := '6A746C4A534F4E203D204A534F4E2E7061727365287056616C7565293B0A2020202020202020202020207D0A202020202020202020202020636174636820286529207B0A2020202020202020202020207D0A0A0A202020202020202020207D0A20202020';
wwv_flow_imp.g_varchar2_table(79) := '202020202020707265766A746C4A534F4E203D207569772E5F76616C7565732E646174614A534F4E3B20202F2F2073746F72652074686520707265762076616C75650A202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(80) := '20202020202020202020202020202F2F20646973706C617956616C7565466F722073686F756C64204E4F54206368616E67652073746174650A202020202020202020207569772E5F696E6974446174614A534F4E286A746C4A534F4E293B0A2020202020';
wwv_flow_imp.g_varchar2_table(81) := '202020202072657475726E56616C7565203D207569772E5F676574544C287569772E6F7074696F6E732E6C616E67293B0A202020202020202020207569772E5F696E6974446174614A534F4E28707265766A746C4A534F4E293B2020202020202F2F2072';
wwv_flow_imp.g_varchar2_table(82) := '6573746F7265207468652076616C75650A0A2020202020202020202072657475726E2072657475726E56616C75653B0A202020202020207D0A202020207D293B0A0A20207D2C0A0A0A0A20202F2F205468616E6B20796F7520746F204D656E6E6F20486F';
wwv_flow_imp.g_varchar2_table(83) := '6F67656E64696A6B20666F72207468697320636F64650A20202F2F2068747470733A2F2F6769746875622E636F6D2F6D656E6E6F6F6F2F6F72636C617065782D6D6F64616C2D6C6F760A20205F616464435353546F546F704C6576656C3A2066756E6374';
wwv_flow_imp.g_varchar2_table(84) := '696F6E202829207B0A2020202076617220756977203D20746869733B0A202020202F2F204353532066696C6520697320616C776179732070726573656E74207768656E207468652063757272656E742077696E646F772069732074686520746F70207769';
wwv_flow_imp.g_varchar2_table(85) := '6E646F772C20736F20646F206E6F7468696E670A202020206966202877696E646F77203D3D3D2077696E646F772E746F7029207B0A20202020202072657475726E3B0A202020207D0A202020207661722063737353656C6563746F72203D20276C696E6B';
wwv_flow_imp.g_varchar2_table(86) := '5B72656C3D227374796C657368656574225D5B687265662A3D226A746C5F6974656D225D273B0A0A202020202F2F20436865636B2069662066696C652065786973747320696E20746F702077696E646F770A20202020696620287569772E5F746F704170';
wwv_flow_imp.g_varchar2_table(87) := '65782E6A51756572792863737353656C6563746F72292E6C656E677468203D3D3D203029207B0A2020202020207569772E5F746F70417065782E6A517565727928276865616427292E617070656E6428242863737353656C6563746F72292E636C6F6E65';
wwv_flow_imp.g_varchar2_table(88) := '2829293B0A202020207D0A20207D2C0A0A0A20205F696E6974456C656D656E74733A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20202020207569772E5F656C656D656E74732E2477696E646F77203D2075';
wwv_flow_imp.g_varchar2_table(89) := '69772E5F746F70417065782E6A51756572792877696E646F77293B0A20202020207569772E5F656C656D656E74732E24646F63756D656E74203D207569772E5F746F70417065782E6A51756572792877696E646F772E746F702E646F63756D656E74293B';
wwv_flow_imp.g_varchar2_table(90) := '0A20202020207569772E5F656C656D656E74732E24626F6479203D207569772E5F746F70417065782E6A51756572792877696E646F772E746F702E646F63756D656E742E626F6479293B0A0A20207D2C0A0A0A20205F696E69744469616C6F67456C656D';
wwv_flow_imp.g_varchar2_table(91) := '656E74733A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E74203D207569772E5F746F70417065782E6A517565727928276469';
wwv_flow_imp.g_varchar2_table(92) := '762E6A746C6974656D2D636F6E74656E7427293B0A20202020207569772E5F656C656D656E74732E2473617665427574746F6E203D207569772E5F746F70417065782E6A51756572792827627574746F6E2E6A746C6974656D2D736176652D627574746F';
wwv_flow_imp.g_varchar2_table(93) := '6E27293B0A20202020207569772E5F656C656D656E74732E2463616E63656C427574746F6E203D207569772E5F746F70417065782E6A51756572792827627574746F6E2E6A746C6974656D2D63616E63656C2D627574746F6E27293B0A0A20207D2C0A0A';
wwv_flow_imp.g_varchar2_table(94) := '0A20205F696E697442617365456C656D656E74733A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20202020207569772E6C6F672820225F696E697442617365456C656D656E747322293B0A20202020207569';
wwv_flow_imp.g_varchar2_table(95) := '772E656C6F67282022656C656D656E74222C207569772E656C656D656E74293B0A0A20202020207569772E5F76616C7565732E6669656C6453697A65203D207569772E6F7074696F6E732E6974656D54797065203D3D3D202254455854223F207569772E';
wwv_flow_imp.g_varchar2_table(96) := '5F6974656D242E61747472282273697A652229203A207569772E5F6974656D242E617474722822636F6C7322293B0A2020202020696620287569772E6F7074696F6E732E6974656D54797065203D3D3D202254455854415245412229207B0A2020202020';
wwv_flow_imp.g_varchar2_table(97) := '20207569772E5F76616C7565732E6669656C64526F7773203D207569772E5F6974656D242E617474722822726F777322293B0A20202020207D0A20202020207569772E5F76616C7565732E6669656C644D61784C656E677468203D207569772E5F697465';
wwv_flow_imp.g_varchar2_table(98) := '6D242E6174747228226D61786C656E67746822293B0A0A20202020202F2F205374617274696E67207769746820415045582031382E3120746865206974656D2073657420697320746865206974656D5772617070657220636C6173730A20202020207569';
wwv_flow_imp.g_varchar2_table(99) := '772E5F656C656D656E74732E246974656D736574203D207569772E5F6974656D242E706172656E7428293B0A20202020207569772E5F656C656D656E74732E246D6C73427574746F6E203D207569772E5F656C656D656E74732E246974656D7365742E66';
wwv_flow_imp.g_varchar2_table(100) := '696E642827627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E27293B0A20207D2C0A0A0A20202F2F205F73796E634C616E67756167654D617020696E69746973207468652062617365206461746120666F72205F676574544C0A20202F2F20';
wwv_flow_imp.g_varchar2_table(101) := '497420637265617465732061206D6170206F66206C616E677561676520636F64657320616E642074686569722076616C75657320666F722066617374206163636573730A20205F73796E634C616E67756167654D61703A2066756E6374696F6E2829207B';
wwv_flow_imp.g_varchar2_table(102) := '0A202020202076617220756977203D20746869732C0A20202020202020202069203D206E756C6C2C0A20202020202020202074616773203D207B7D3B0A0A20202020207569772E6C6F672820225F73796E634C616E67756167654D617022293B0A202020';
wwv_flow_imp.g_varchar2_table(103) := '202074616773203D207569772E5F76616C7565732E646174614A534F4E3B0A0A20202020202F2F20687474703A2F2F6D617474736E696465722E636F6D2F686F772D746F2D656666696369656E746C792D7365617263682D612D6A736F6E2D6172726179';
wwv_flow_imp.g_varchar2_table(104) := '2F0A20202020207569772E5F76616C7565732E7461674D6170203D207B7D3B0A2020202020666F72202869203D20303B20746167732E6C656E677468203E20693B2069202B3D203129207B0A2020202020202020207569772E5F76616C7565732E746167';
wwv_flow_imp.g_varchar2_table(105) := '4D61705B746167735B695D2E6C5D203D20746167735B695D2E746C3B0A2020202020202020202F2F20636F6E736F6C652E6C6F6728692C20225B22202B20746167735B695D2E6C202B20225D203D20222C20746167735B695D2E746C290A20202020207D';
wwv_flow_imp.g_varchar2_table(106) := '0A2020202020200A20207D2C0A0A0A20202F2F2067657420746865206C616E67756167652076616C756520666F72206120676976656E206C616E677561676520636F64650A20205F676574544C3A2066756E6374696F6E286C616E67436F646529207B0A';
wwv_flow_imp.g_varchar2_table(107) := '202020202076617220756977203D20746869733B0A202020202072657475726E207569772E5F76616C7565732E7461674D61705B6C616E67436F64655D3B0A20207D2C0A0A0A0A20202F2F20657870656374732061206A746C4A534F4E20737472756374';
wwv_flow_imp.g_varchar2_table(108) := '757265206F7220616E20656D707479206F626A6563740A20205F696E6974446174614A534F4E3A2066756E6374696F6E286A746C4A534F4E297B0A202020202076617220756977203D20746869732C0A2020202020202020206A736F6E44617461203D20';
wwv_flow_imp.g_varchar2_table(109) := '5B5D2C0A202020202020202020696E7075745F64617461203D206A746C4A534F4E207C7C207B7D3B0A0A2020202020202020207569772E6C6F6728225F696E6974446174614A534F4E22293B0A2020202020202020207569772E656C6F67287B696E7075';
wwv_flow_imp.g_varchar2_table(110) := '745F646174617D293B0A0A202020202069662028617065782E6A51756572792E6973456D7074794F626A65637428696E7075745F646174612929207B0A20202020202020207569772E6C6F672822496E697469616C697A696E67207769746820656D7074';
wwv_flow_imp.g_varchar2_table(111) := '792076616C756522293B0A0A20202020202020202F2F20546865207265636F726420697320656D70747920736F207765206275696C642061200A20202020202020202F2F206275696C64204A534F4E207769746820746869732073747275637475726520';
wwv_flow_imp.g_varchar2_table(112) := '746F20736565642069743A0A20202020202020202F2F20205B207B226C223A20227573222C2022746C223A202250726F6A65637420416E616C79736973227D0A20202020202020202F2F20202C207B226C223A20226672222C2022746C223A2022416E61';
wwv_flow_imp.g_varchar2_table(113) := '6C7973652064652070726F6A6574227D0A20202020202020202F2F20202C207B226C223A20226573222C2022746C223A2022416E616C697369732064652070726F6A6563746F227D5D0A20202020202020207569772E5F76616C7565732E6C616E677561';
wwv_flow_imp.g_varchar2_table(114) := '6765732E666F72456163682866756E6374696F6E286C29207B0A20202020202020202020206A736F6E446174612E70757368287B226C223A206C2C2022746C223A2022227D293B0A20202020202020207D293B0A0A20202020202020207569772E5F7661';
wwv_flow_imp.g_varchar2_table(115) := '6C7565732E646174614A534F4E203D206A736F6E446174613B0A20202020202020207569772E5F76616C7565732E6E65775265636F7264203D20747275653B0A20202020207D0A2020202020656C7365207B0A202020202020207569772E5F76616C7565';
wwv_flow_imp.g_varchar2_table(116) := '732E646174614A534F4E203D20696E7075745F646174613B0A202020202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B0A20202020207D0A0A20202020207569772E5F73796E634C616E67756167654D617028293B0A';
wwv_flow_imp.g_varchar2_table(117) := '0A20207D2C0A0A0A20202F2F204D61696E7461696E7320746865204A544C204A534F4E206461746120696E2073796E632E0A20202F2F206966206372656174696E672061206E6577207265636F72642C20616C6C2074686520656E74657265642076616C';
wwv_flow_imp.g_varchar2_table(118) := '75657320617265207573656420666F7220414C4C20746865206C616E6775616765730A20202F2F206F74686572776973652074686520656E74657265642076616C756520676F657320696E746F2074686520637572725F6C616E675F696E646578206F6E';
wwv_flow_imp.g_varchar2_table(119) := '6C790A20205F73796E634A534F4E646174613A2066756E6374696F6E286576656E744F626A29207B0A20202020202F2F2076617220756977203D206576656E744F626A2E646174612E7569772C0A2020202020766172207569773B0A0A20202020206966';
wwv_flow_imp.g_varchar2_table(120) := '2028747970656F66206576656E744F626A20213D2022756E646566696E65642229207B0A20202020202020202F2F20776520776572652063616C6C2066726F6D20616E206576656E740A2020202020202020756977203D206576656E744F626A2E646174';
wwv_flow_imp.g_varchar2_table(121) := '612E7569773B0A20202020207D0A2020202020656C7365207B0A20202020202020202F2F206469726563742063616C6C0A2020202020202020756977203D20746869733B0A20202020207D0A20202020207569772E6C6F6728225F73796E634A534F4E64';
wwv_flow_imp.g_varchar2_table(122) := '61746122293B0A0A2020202020696620287569772E5F76616C7565732E6E65775265636F726429207B0A20202020202020202F2F204F6E206E6577207265636F72642077652077616E7420746F207361766520746865206E657720656E74657265642076';
wwv_flow_imp.g_varchar2_table(123) := '616C756520696E746F2074686520414C4C207468650A20202020202020202F2F207265636F72647320696E20746865204A534F4E207374727563747572650A2020202020202020666F7220287661722069203D207569772E5F76616C7565732E746F7461';
wwv_flow_imp.g_varchar2_table(124) := '6C4C616E677561676573202D20313B2069203E3D20303B20692D2D29207B0A202020202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E746C203D207569772E5F6974656D242E76616C28293B0A20202020202020207D0A2020';
wwv_flow_imp.g_varchar2_table(125) := '2020207D0A2020202020656C7365207B0A20202020202020202F2F207361766520746865206E6577207465787420696E746F20746865204A534F4E2073747275637475726520666F72207468652063757272656E74206C616E67756167650A2020202020';
wwv_flow_imp.g_varchar2_table(126) := '2020207569772E5F76616C7565732E646174614A534F4E5B7569772E5F76616C7565732E637572725F6C616E675F696E6465785D2E746C203D207569772E5F6974656D242E76616C28293B0A20202020207D0A0A20202020207569772E5F73796E634C61';
wwv_flow_imp.g_varchar2_table(127) := '6E67756167654D617028293B0A20207D2C0A0A0A0A20205F696E69744469616C6F67427574746F6E733A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20202020207569772E5F656C656D656E74732E246361';
wwv_flow_imp.g_varchar2_table(128) := '6E63656C427574746F6E0A20202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C6543616E63656C427574746F6E436C69636B293B0A0A20202020207569772E5F656C656D656E74732E247361';
wwv_flow_imp.g_varchar2_table(129) := '7665427574746F6E0A20202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C6553617665427574746F6E436C69636B293B0A0A20207D2C0A0A0A0A20205F68616E646C6543616E63656C427574';
wwv_flow_imp.g_varchar2_table(130) := '746F6E436C69636B3A2066756E6374696F6E286576656E744F626A29207B0A202020202076617220756977203D206576656E744F626A2E646174612E7569773B0A0A20202020202F2F20696620746865206469616C6F67206F70656E732C207765277265';
wwv_flow_imp.g_varchar2_table(131) := '206E6F742061206E6577207265636F726420616E79206D6F72650A20202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B0A0A20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F67282763';
wwv_flow_imp.g_varchar2_table(132) := '6C6F736527293B202F2F20746869732073686F756C64206361736361646520746F2072656D6F766520746865206469616C6F670A0A20207D2C0A0A0A0A20205F68616E646C6553617665427574746F6E436C69636B3A2066756E6374696F6E286576656E';
wwv_flow_imp.g_varchar2_table(133) := '744F626A29207B0A202020202076617220756977203D206576656E744F626A2E646174612E7569772C0A202020202020202020646973706C61795F76616C75653B0A0A20202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E74';
wwv_flow_imp.g_varchar2_table(134) := '2E66696E6428272E6A746C6974656D2D76616C756527292E656163682866756E6374696F6E28692C656C297B0A20202020202020202F2F206C6F6F70207468726F75676820616C6C206469616C6F6720656C656D656E747320616E642073746F72652074';
wwv_flow_imp.g_varchar2_table(135) := '72616E736C6174696F6E730A20202020202020202F2F206261636B20696E746F2074686520646174614A534F4E207374727563747572650A0A20202020202020202F2F207569772E6C6F672869202B20222822202B20656C2E646174617365742E6C616E';
wwv_flow_imp.g_varchar2_table(136) := '67202B2022293A22202B20656C2E76616C7565293B0A0A20202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E6C203D20656C2E646174617365742E6C616E673B0A20202020202020207569772E5F76616C7565732E64617461';
wwv_flow_imp.g_varchar2_table(137) := '4A534F4E5B695D2E746C203D20656C2E76616C75653B0A2020202020202020696620287569772E5F76616C7565732E637572725F6C616E675F696E646578203D3D3D206929207B0A2020202020202020202020646973706C61795F76616C7565203D2065';
wwv_flow_imp.g_varchar2_table(138) := '6C2E76616C75653B0A20202020202020207D0A0A20202020207D293B0A0A20202020207569772E5F73796E634C616E67756167654D617028293B0A0A20202020202F2F20776527726520646F6E652022736176696E6722206261636B2066726F6D207468';
wwv_flow_imp.g_varchar2_table(139) := '65206469616C6F672C20636C65617220746865206E65775265636F726420666C61670A20202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B0A0A20202020207569772E5F6974656D242E76616C28646973706C61795F';
wwv_flow_imp.g_varchar2_table(140) := '76616C7565293B0A20202020207569772E5F7369676E616C4368616E676528293B0A0A20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B202F2F20746869732073686F756C6420636173636164';
wwv_flow_imp.g_varchar2_table(141) := '6520746F2072656D6F766520746865206469616C6F670A20207D2C0A0A0A20205F7369676E616C4368616E67653A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A20202020202F2F204E65656420746F207573';
wwv_flow_imp.g_varchar2_table(142) := '6520617065782E6A517565727920666F7220746865206576656E747320746F207265676973746572207769746820746865204441206672616D65776F726B0A2020202020617065782E6A5175657279287569772E5F6974656D245B305D292E7472696767';
wwv_flow_imp.g_varchar2_table(143) := '657228276368616E676527293B0A20207D2C0A0A0A20205F68616E646C654F70656E436C69636B3A2066756E6374696F6E286576656E744F626A29207B0A202020202076617220756977203D206576656E744F626A2E646174612E7569773B0A0A202020';
wwv_flow_imp.g_varchar2_table(144) := '20207569772E6C6F6728225F68616E646C654F70656E436C69636B22293B0A0A20202020207569772E5F73796E634A534F4E64617461286576656E744F626A293B0A20202020207569772E5F73686F774469616C6F6728293B0A20207D2C0A0A0A20205F';
wwv_flow_imp.g_varchar2_table(145) := '73686F774469616C6F673A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869732C0A2020202020202020204449414C4F475F434C415353203D202775692D6469616C6F67272C20202F2F2077652070726566657220697420';
wwv_flow_imp.g_varchar2_table(146) := '746F202775692D6469616C6F672D2D617065782720746F2061766F69642072652D63656E746572696E670A2020202020202020206C616E675461626C652C0A202020202020202020637572725F6C616E67203D207569772E5F76616C7565732E63757272';
wwv_flow_imp.g_varchar2_table(147) := '5F6C616E675F696E6465782C0A2020202020202020206469616C6F67506F736974696F6E2C0A2020202020202020206469616C6F6748746D6C3B0A0A20202020207569772E6C6F6728225F73686F774469616C6F6722293B0A0A0A202020202069662028';
wwv_flow_imp.g_varchar2_table(148) := '7569772E5F76616C7565732E636F6E74726F6C6C65724D6F6465207C7C2021617065782E6A51756572792E6973456D7074794F626A656374287569772E5F656C656D656E74732E24677269642929207B0A20202020202020207569772E6C6F6728277765';
wwv_flow_imp.g_varchar2_table(149) := '206469646E5C277420676574206120686F6C64206F662074686520677269642C206D617962652074727920616761696E27293B0A20202020202020207569772E5F696E697447726964436F6E66696728293B0A20202020207D0A0A20202020206C616E67';
wwv_flow_imp.g_varchar2_table(150) := '5461626C65203D200A2020202020202020202020273C7461626C6520636C6173733D22742D5265706F72742D7265706F7274222073756D6D6172793D22417661696C61626C65205472616E736C6174696F6E73223E5C6E27202B0A202020202020202020';
wwv_flow_imp.g_varchar2_table(151) := '202027203C74723E5C6E27202B0A20202020202020202020202720203C746820636C6173733D22742D5265706F72742D636F6C48656164223E27202B207569772E5F76616C7565732E6D657373616765732E6C616E67756167654C6162656C202B20273C';
wwv_flow_imp.g_varchar2_table(152) := '2F74683E27202B0A20202020202020202020202720203C746820636C6173733D22742D5265706F72742D636F6C4865616420752D744C223E27202B207569772E5F76616C7565732E6D657373616765732E6C616E677561676556616C7565202B20273C2F';
wwv_flow_imp.g_varchar2_table(153) := '74683E27202B0A202020202020202020202027203C2F74723E5C6E273B0A20202020202020202020202F2F2027203C74723E5C6E273B0A0A2020202020242E65616368287569772E5F76616C7565732E6C616E6775616765732C2066756E6374696F6E28';
wwv_flow_imp.g_varchar2_table(154) := '20696E6465782C206C616E672029207B0A202020202020206C616E675461626C65202B3D0A2020202020202027203C747227202B2028637572725F6C616E673D3D696E6465783F202720636C6173733D2273656C656374656422273A272729202B20273E';
wwv_flow_imp.g_varchar2_table(155) := '5C6E27202B0A202020202020202720203C746420636C6173733D22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D7443223E27202B20617065782E7574696C2E65736361706548544D4C41747472286C61';
wwv_flow_imp.g_varchar2_table(156) := '6E6729202B20273C2F74643E27202B0A202020202020202720203C746420636C6173733D22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D744C223E273B0A20202020202020696620287569772E6F7074';
wwv_flow_imp.g_varchar2_table(157) := '696F6E732E6974656D54797065203D3D3D2022544558542229207B0A2020202020202020206C616E675461626C65202B3D0A20202020202020202027202020203C696E70757420747970653D22746578742220636C6173733D22746578745F6669656C64';
wwv_flow_imp.g_varchar2_table(158) := '20617065782D6974656D2D74657874206A746C6974656D2D76616C75652220646174612D6C616E673D2227202B206C616E67202B2027222076616C75653D2227202B20617065782E7574696C2E65736361706548544D4C41747472287569772E5F676574';
wwv_flow_imp.g_varchar2_table(159) := '544C286C616E672929202B2027222073697A653D2227202B207569772E5F76616C7565732E6669656C6453697A65202B202722206D61786C656E6774683D2227202B207569772E5F76616C7565732E6669656C644D61784C656E677468202B2027223E3C';
wwv_flow_imp.g_varchar2_table(160) := '2F74643E273B0A202020202020207D0A20202020202020656C7365207B0A2020202020202020206C616E675461626C65202B3D0A20202020202020202027202020203C746578746172656120636C6173733D22746578746172656120617065782D697465';
wwv_flow_imp.g_varchar2_table(161) := '6D2D7465787461726561206A746C6974656D2D76616C75652220646174612D6C616E673D2227202B206C616E67202B20272227202B0A20202020202020202020202020202720636F6C733D2227202B207569772E5F76616C7565732E6669656C6453697A';
wwv_flow_imp.g_varchar2_table(162) := '65202B20272220726F77733D2227202B207569772E5F76616C7565732E6669656C64526F7773202B20272227202B200A202020202020202020202020202027206D61786C656E6774683D2227202B207569772E5F76616C7565732E6669656C644D61784C';
wwv_flow_imp.g_varchar2_table(163) := '656E677468202B20272227202B200A2020202020202020202020202020273E27202B20617065782E7574696C2E65736361706548544D4C41747472287569772E5F676574544C286C616E672929202B20273C2F74657874617265613E273B0A2020202020';
wwv_flow_imp.g_varchar2_table(164) := '20207D0A0A202020202020206C616E675461626C65202B3D0A202020202020202027203C2F74723E5C6E273B0A20202020207D293B0A20202020206C616E675461626C65202B3D0A2020202020273C2F7461626C653E5C6E273B0A0A2020202020206469';
wwv_flow_imp.g_varchar2_table(165) := '616C6F6748746D6C203D0A2020202020202020202020273C64697620636C6173733D2227202B207569772E5F76616C7565732E706F707570436C617373202B2027223E3C64697620636C6173733D226A746C6974656D2D636F6E7461696E65722075692D';
wwv_flow_imp.g_varchar2_table(166) := '776964676574223E5C6E27202B0A20202020202020202020202720203C64697620636C6173733D226A746C6974656D2D627574746F6E2D636F6E7461696E6572223E5C6E27202B0A20202020202020202020202720202020203C627574746F6E20636C61';
wwv_flow_imp.g_varchar2_table(167) := '73733D226A746C6974656D2D63616E63656C2D627574746F6E20742D427574746F6E223E27202B0A202020202020202020202027202020202020203C7370616E20636C6173733D22742D427574746F6E2D6C6162656C223E27202B207569772E5F76616C';
wwv_flow_imp.g_varchar2_table(168) := '7565732E6D657373616765732E63616E63656C427574746F6E202B20273C2F7370616E3E27202B0A20202020202020202020202F2F2027202020202020203C7370616E20636C6173733D2275692D69636F6E2075692D69636F6E2D636C6F7365223E3C2F';
wwv_flow_imp.g_varchar2_table(169) := '7370616E3E27202B200A20202020202020202020202720202020203C2F627574746F6E3E5C6E27202B0A20202020202020202020202720202020203C627574746F6E20636C6173733D226A746C6974656D2D736176652D627574746F6E20742D42757474';
wwv_flow_imp.g_varchar2_table(170) := '6F6E20742D427574746F6E2D2D686F74223E27202B200A202020202020202020202027202020202020203C7370616E20636C6173733D22742D427574746F6E2D6C6162656C223E27202B207569772E5F76616C7565732E6D657373616765732E6170706C';
wwv_flow_imp.g_varchar2_table(171) := '794368616E676573202B20273C2F7370616E3E27202B0A202020202020202020202027202020202020203C7370616E20636C6173733D22742D49636F6E20742D49636F6E2D2D72696768742066612066612D636865636B223E3C2F7370616E3E27202B20';
wwv_flow_imp.g_varchar2_table(172) := '0A20202020202020202020202720202020203C2F627574746F6E3E5C6E27202B0A20202020202020202020202720203C2F6469763E5C6E27202B0A20202020202020202020202720203C64697620636C6173733D226A746C6974656D2D636F6E74656E74';
wwv_flow_imp.g_varchar2_table(173) := '223E5C6E27202B0A20202020202020202020202020206C616E675461626C65202B0A20202020202020202020202720203C2F6469763E5C6E27202B0A2020202020202020202020273C2F6469763E3C2F6469763E5C6E273B0A0A20202020207569772E5F';
wwv_flow_imp.g_varchar2_table(174) := '656C656D656E74732E24626F64792E617070656E64286469616C6F6748746D6C293B0A0A20202020202F2F2072656164792061206469616C6F6720636F6E7461696E6572206279206372656174696E672061206469760A20202020202F2F207569772E5F';
wwv_flow_imp.g_varchar2_table(175) := '656C656D656E74732E246469616C6F67203D202428706F70757053454C293B0A20202020207569772E5F656C656D656E74732E246469616C6F67203D207569772E5F746F70417065782E6A5175657279287569772E5F76616C7565732E706F7075705345';
wwv_flow_imp.g_varchar2_table(176) := '4C293B0A0A20202020202F2F206469616C6F67506F736974696F6E203D207569772E5F6974656D242E6F666673657428293B20202F2F20706F736974696F6E206E65787420746F20746865206974656D0A20202020206966202877696E646F77203D3D3D';
wwv_flow_imp.g_varchar2_table(177) := '2077696E646F772E746F7029207B0A20202020202020206469616C6F67506F736974696F6E203D207B206D793A20226C656674222C2061743A20226C6566742063656E746572222C206F663A207569772E5F6974656D245B305D207D3B20202F2F20706F';
wwv_flow_imp.g_varchar2_table(178) := '736974696F6E206E65787420746F20746865206974656D0A20202020207D0A2020202020656C7365207B0A20202020202020202F2F20706F736974696F6E206261736564206F6E20746865206469616C6F67202863656E746572656421290A2020202020';
wwv_flow_imp.g_varchar2_table(179) := '2020206469616C6F67506F736974696F6E203D207B206D793A202263656E7465722063656E746572222C2061743A202263656E7465722063656E746572222C206F663A207569772E5F746F70417065782E6A517565727928272E272B4449414C4F475F43';
wwv_flow_imp.g_varchar2_table(180) := '4C415353295B305D207D3B0A20202020207D0A0A20202020202F2F206F70656E2063726561746564206469762061732061206469616C6F670A20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F67287B0A20202020202020';
wwv_flow_imp.g_varchar2_table(181) := '2020636C6F73654F6E4573636170653A20747275652C0A2020202020202020207469746C653A2020202020202020207569772E6F7074696F6E732E6469616C6F675469746C652C0A2020202020202020206175746F526573697A653A2020202074727565';
wwv_flow_imp.g_varchar2_table(182) := '2C0A2020202020202020206D696E57696474683A2020202020203430302C0A2020202020202020206D696E4865696768743A20202020203235302C0A20202020202020202077696474683A202020202020202020276175746F272C0A2020202020202020';
wwv_flow_imp.g_varchar2_table(183) := '206865696768743A2020202020202020276175746F272C0A2020202020202020206D6F64616C3A202020202020202020747275652C0A2020202020202020206469616C6F67436C6173733A2020204449414C4F475F434C4153532C0A2020202020202020';
wwv_flow_imp.g_varchar2_table(184) := '20706F736974696F6E3A2020202020206469616C6F67506F736974696F6E2C0A2020202020202020206F70656E3A2066756E6374696F6E2829207B0A2020202020202020202020202F2F207569772E5F746F70417065782E6E617669676174696F6E2E62';
wwv_flow_imp.g_varchar2_table(185) := '6567696E467265657A655363726F6C6C28293B0A2020202020202020202020207569772E5F696E69744469616C6F67456C656D656E747328293B0A2020202020202020202020207569772E5F696E69744469616C6F67427574746F6E7328293B0A0A2020';
wwv_flow_imp.g_varchar2_table(186) := '202020202020202020202F2F20466F637573206F6E207468652066697273742076616C7565206F66207468652063757272656E74206C616E6775616765200A2020202020202020202020207569772E5F656C656D656E74732E246469616C6F67436F6E74';
wwv_flow_imp.g_varchar2_table(187) := '656E742E66696E64282774722E73656C6563746564202E6A746C6974656D2D76616C756527292E747269676765722827666F63757327293B0A2020202020202020207D2C0A202020202020202020636C6F73653A2066756E6374696F6E2829207B0A0A20';
wwv_flow_imp.g_varchar2_table(188) := '20202020202020202020202F2F20242874686973292E6469616C6F67282764657374726F7927293B0A2020202020202020202020207569772E5F656C656D656E74732E246469616C6F672E72656D6F766528293B0A202020202020202020202020756977';
wwv_flow_imp.g_varchar2_table(189) := '2E5F656C656D656E74732E24646F63756D656E742E66696E64287569772E5F76616C7565732E706F70757053454C292E72656D6F766528293B0A2020202020202020202020202F2F207569772E5F746F70417065782E6E617669676174696F6E2E656E64';
wwv_flow_imp.g_varchar2_table(190) := '467265657A655363726F6C6C28293B0A0A2020202020202020202020207569772E5F7265736574466F63757328293B0A2020202020202020207D0A202020202020207D290A202020202020202E6F6E28276B6579646F776E272C2066756E6374696F6E28';
wwv_flow_imp.g_varchar2_table(191) := '65767429207B0A2020202020202020202020696620286576742E6B6579436F6465203D3D3D20242E75692E6B6579436F64652E45534341504529207B0A2020202020202020202020202020207569772E5F656C656D656E74732E246469616C6F672E6469';
wwv_flow_imp.g_varchar2_table(192) := '616C6F672827636C6F736527293B0A20202020202020202020207D202020202020202020202020202020200A20202020202020202020206576742E73746F7050726F7061676174696F6E28293B0A202020202020207D293B0A0A0A20207D2C0A0A0A2020';
wwv_flow_imp.g_varchar2_table(193) := '64697361626C653A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A2020202020696620287569772E5F76616C7565732E64697361626C6564203D3D3D2066616C736529207B0A20202020202020207569772E5F';
wwv_flow_imp.g_varchar2_table(194) := '6974656D240A20202020202020202020202E61747472282764697361626C6564272C2764697361626C656427293B0A0A20202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E0A20202020202020202020202E61747472282764';
wwv_flow_imp.g_varchar2_table(195) := '697361626C6564272C2764697361626C656427290A20202020202020202020202E756E62696E642827636C69636B272C207569772E5F68616E646C654F70656E436C69636B293B0A20202020207D0A0A20202020207569772E5F76616C7565732E646973';
wwv_flow_imp.g_varchar2_table(196) := '61626C6564203D20747275653B0A20207D2C0A0A0A2020656E61626C653A2066756E6374696F6E2829207B0A202020202076617220756977203D20746869733B0A0A2020202020696620287569772E5F76616C7565732E64697361626C6564203D3D3D20';
wwv_flow_imp.g_varchar2_table(197) := '7472756529207B0A202020202020207569772E5F6974656D242E72656D6F766541747472282764697361626C656427293B0A202020202020207569772E5F656C656D656E74732E246D6C73427574746F6E0A202020202020202020202E72656D6F766541';
wwv_flow_imp.g_varchar2_table(198) := '747472282764697361626C656427290A202020202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69636B293B0A0A202020202020207569772E5F76616C7565732E64697361';
wwv_flow_imp.g_varchar2_table(199) := '626C6564203D2066616C73653B0A20202020207D0A20207D0A7D293B0A0A2F2F2320736F757263654D617070696E6755524C3D6A746C5F6974656D2E6A732E6D61700A';
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
wwv_flow_imp.g_varchar2_table(21) := '69772E6F7074696F6E732E6974656D4E616D65293B5C6E5C6E202020207569772E5F616464435353546F546F704C6576656C28293B5C6E5C6E202020202F2F2068656C7065722066756E6374696F6E20666F722066696E64696E672074686520696E6465';
wwv_flow_imp.g_varchar2_table(22) := '7820706F736974696F6E206F66206F75722063757272656E7420646973706C61796564206C616E67756167655C6E2020202066756E6374696F6E206C616E67756167655F696E64657820286A2C206C29207B5C6E2020202020207661722069203D206E75';
wwv_flow_imp.g_varchar2_table(23) := '6C6C2C5C6E20202020202020202020696478203D202D313B5C6E202020202020666F72202869203D20303B206A2E6C656E677468203E206920262620696478203D3D202D313B2069202B3D203129207B5C6E2020202020202020696620286A5B695D2E6C';
wwv_flow_imp.g_varchar2_table(24) := '203D3D3D206C29207B5C6E20202020202020202020696478203D20693B5C6E20202020202020207D5C6E2020202020207D5C6E20202020202072657475726E206964783B5C6E202020207D5C6E5C6E202020207569772E5F637265617465507269766174';
wwv_flow_imp.g_varchar2_table(25) := '6553746F7261676528293B5C6E202020207569772E5F696E6974456C656D656E747328293B5C6E202020207569772E5F696E697442617365456C656D656E747328293B5C6E5C6E5C6E20202020747279207B7569772E5F76616C7565732E6C616E677561';
wwv_flow_imp.g_varchar2_table(26) := '676573203D204A534F4E2E7061727365287569772E6F7074696F6E732E6C616E675F636F646573293B7D5C6E20202020636174636820286529207B636F6E736F6C652E6572726F72285C2254686520646566696E6564206C616E67756167657320617265';
wwv_flow_imp.g_varchar2_table(27) := '206E6F7420666F726D617474656420636F72726563746C792E205365652053686172656420436F6D706F6E657473203E20436F6D706F6E656E74732053657474696E6773203E204A544C204974656D205B506C75672D696E5D5C222C207569772E6F7074';
wwv_flow_imp.g_varchar2_table(28) := '696F6E732E6C616E675F636F646573293B7D5C6E202020207569772E5F76616C7565732E746F74616C4C616E677561676573203D207569772E5F76616C7565732E6C616E6775616765732E6C656E6774683B5C6E5C6E2020202069662028217569772E5F';
wwv_flow_imp.g_varchar2_table(29) := '76616C7565732E636F6E74726F6C6C65724D6F6465207C7C207569772E656C656D656E742E64617461285C2276616C75655C22292029207B5C6E2020202020202F2F2057652061726520616E206E6F7420616E20494720636F6C756D6E20287768657265';
wwv_flow_imp.g_varchar2_table(30) := '207468652076616C7565206973207365742076696120646973706C617956616C7565466F7229205C6E2020202020202F2F206F722077652061726520616E206974656D207769746820616E20696E697469616C2076616C75655C6E202020202020696E69';
wwv_flow_imp.g_varchar2_table(31) := '744A534F4E203D207569772E656C656D656E742E64617461285C2276616C75655C22293B5C6E202020207D5C6E5C6E202020202F2F2073657420746865206672657368206C697374206F66206C616E6775616765735C6E202020207569772E5F696E6974';
wwv_flow_imp.g_varchar2_table(32) := '446174614A534F4E28696E69744A534F4E293B5C6E5C6E202020202F2F20576869636820706F736974696F6E206C616E677561676520617265207765207573696E675C6E202020207569772E5F76616C7565732E637572725F6C616E675F696E64657820';
wwv_flow_imp.g_varchar2_table(33) := '3D206C616E67756167655F696E646578287569772E5F76616C7565732E646174614A534F4E2C207569772E6F7074696F6E732E6C616E67293B5C6E202020205C6E202020202F2F2053796E63206F7572204A534F4E20646174612D76616C756520617474';
wwv_flow_imp.g_varchar2_table(34) := '7269627574652077697468207468652061637475616C2076616C756520696E2074686520636F7272656374206C616E67756167652C206275745C6E202020202F2F20616C736F20647572696E672070616765207375626D697420746F206D616B65207375';
wwv_flow_imp.g_varchar2_table(35) := '7265207765207375626D69742074686520636F72726563742076616C7565205C6E202020207569772E5F6974656D245C6E202020202020202E62696E6428276368616E6765272C207B7569773A207569777D2C207569772E5F73796E634A534F4E646174';
wwv_flow_imp.g_varchar2_table(36) := '61293B5C6E202020207569772E5F656C656D656E74732E24646F63756D656E745C6E202020202020202E62696E642827617065786265666F7265706167657375626D6974272C207B7569773A207569777D2C207569772E5F73796E634A534F4E64617461';
wwv_flow_imp.g_varchar2_table(37) := '293B5C6E5C6E202020207569772E5F656C656D656E74732E246D6C73427574746F6E5C6E202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E646C654F70656E436C69636B293B5C6E5C6E20202020';
wwv_flow_imp.g_varchar2_table(38) := '2F2F20496E6974204150455820706167656974656D2066756E6374696F6E735C6E202020207569772E5F696E6974417065784974656D28293B5C6E5C6E202020202F2F20617065782E6A51756572792877696E646F77292E6F6E285C227468656D653432';
wwv_flow_imp.g_varchar2_table(39) := '72656164795C222C2066756E6374696F6E2829207B5C6E20202020617065782E6A51756572792877696E646F77292E6F6E285C22696E74657261637469766567726964766965776D6F64656C6372656174655C222C2066756E6374696F6E286576656E74';
wwv_flow_imp.g_varchar2_table(40) := '2C20756929207B202F2F2077696C6C207468697320776F726B20666F72206D756C7469706C652049473F5C6E2020202020202F2F20696E69742074686520677269642076616C7565732C20627574207761697420756E74696C2074686520677269642069';
wwv_flow_imp.g_varchar2_table(41) := '732072656164795C6E2020202020207569772E5F696E697447726964436F6E66696728293B5C6E202020207D293B5C6E5C6E20207D2C5C6E5C6E5C6E20205F696E697447726964436F6E6669673A2066756E6374696F6E202829207B5C6E202020207661';
wwv_flow_imp.g_varchar2_table(42) := '7220756977203D20746869732C5C6E2020202020202020726567696F6E203D20617065782E726567696F6E2E66696E64436C6F73657374287569772E5F6974656D245B305D293B5C6E5C6E202020207569772E6C6F67285C225F696E697447726964436F';
wwv_flow_imp.g_varchar2_table(43) := '6E6669675C22293B5C6E202020207569772E656C6F67285C227569772E5F6974656D245C222C207569772E5F6974656D24293B5C6E202020207569772E656C6F67285C22726567696F6E5C222C20726567696F6E293B5C6E5C6E20202020696620287569';
wwv_flow_imp.g_varchar2_table(44) := '772E5F76616C7565732E636F6E74726F6C6C65724D6F646529207B5C6E2020202020202F2F207569772E5F656C656D656E74732E2467726964203D20726567696F6E2E77696467657428292E696E74657261637469766547726964285C22676574437572';
wwv_flow_imp.g_varchar2_table(45) := '72656E74566965775C22293B5C6E2020202020207569772E5F656C656D656E74732E246967203D20726567696F6E2E77696467657428292E696E7465726163746976654772696428293B5C6E2020202020207569772E5F656C656D656E74732E24677269';
wwv_flow_imp.g_varchar2_table(46) := '64203D20726567696F6E2E77696467657428292E696E74657261637469766547726964285C2267657456696577735C22292E677269643B5C6E2020202020207569772E656C6F67285C225F656C656D656E74732E24677269643A5C222C207569772E5F65';
wwv_flow_imp.g_varchar2_table(47) := '6C656D656E74732E2467726964293B5C6E5C6E2F2A5C6E202020202020726567696F6E2E77696467657428292E6F6E285C22696E74657261637469766567726964736176655C222C2066756E6374696F6E2829207B5C6E20202020202020202F2F20576F';
wwv_flow_imp.g_varchar2_table(48) := '756C64206C696B6520746F2063616C6C20636C65617253656C656374696F6E282920696E73746561642C206275742063616E277420666967757265206F757420686F772E5C6E20202020202020202F2F205475726E2065646974206F666620746F20666F';
wwv_flow_imp.g_varchar2_table(49) := '7263652061206672657368206C6F6164206F66206461746120616761696E2E5C6E20202020202020202F2F205965732C2074686973206973206120746F74616C206861636B2C20616E6420776F756C64206C6F766520746F206C6561726E206F66206120';
wwv_flow_imp.g_varchar2_table(50) := '62657474657220617070726F6163685C6E20202020202020207569772E5F656C656D656E74732E24677269642E736574456469744D6F64652866616C7365293B5C6E2020202020207D293B5C6E2A2F5C6E5C6E202020207D5C6E20202020656C7365207B';
wwv_flow_imp.g_varchar2_table(51) := '5C6E2020202020207569772E6C6F67285C226E6F7420616E2049475C22293B5C6E202020207D5C6E5C6E20207D2C5C6E5C6E5C6E20205F7265736574466F6375733A2066756E6374696F6E202829207B5C6E2020202076617220756977203D2074686973';
wwv_flow_imp.g_varchar2_table(52) := '3B5C6E5C6E202020207569772E6C6F67285C225F7265736574466F6375735C22293B5C6E5C6E20202020696620287569772E5F76616C7565732E636F6E74726F6C6C65724D6F646529207B20202F2F2061726520776520696E7369646520612067726964';
wwv_flow_imp.g_varchar2_table(53) := '3F5C6E2020202020202F2F2053696E63652077652068617665206120617065782E6974656D28292E676574506F70757053656C6563746F72207468697320636F6465206973207265616C6C79206E6F74206E65636573736172795C6E2020202020202F2F';
wwv_flow_imp.g_varchar2_table(54) := '20627574206974207365656D7320746F2070726F766964652061206D75636820626574746572207573657220657870657269656E636520626563617365206F6E63652074686520706F70757020636C6F7365735C6E2020202020202F2F20776527726520';
wwv_flow_imp.g_varchar2_table(55) := '6261636B2065646974696E67207468652063656C6C206173206F70706F73656420746F20686176696E6720746F20666F726365207468652065646974696E672E5C6E5C6E2020202020202F2F207569772E656C6F67285C227569772E5F656C656D656E74';
wwv_flow_imp.g_varchar2_table(56) := '732E24677269645C222C207569772E5F656C656D656E74732E2467726964293B5C6E2020202020202F2F207569772E656C6F67285C227569772E5F656C656D656E74732E2469675C222C207569772E5F656C656D656E74732E246967293B5C6E5C6E2020';
wwv_flow_imp.g_varchar2_table(57) := '20202020747279207B5C6E20202020202020202F2F2066696E64206F757220636F6C756D6E20696E2074686520677269645C6E20202020202020202F2F205468616E6B20796F7520746F204D656E6E6F20486F6F67656E64696A6B20666F7220706F7274';
wwv_flow_imp.g_varchar2_table(58) := '696F6E73206F66207468697320636F64655C6E20202020202020202F2F2068747470733A2F2F6769746875622E636F6D2F6D656E6E6F6F6F2F6F72636C617065782D6D6F64616C2D6C6F765C6E5C6E2020202020202020766172207265636F7264496420';
wwv_flow_imp.g_varchar2_table(59) := '3D207569772E5F656C656D656E74732E24677269642E6D6F64656C2E6765745265636F72644964287569772E5F656C656D656E74732E24677269642E76696577242E67726964282767657453656C65637465645265636F72647327295B305D293B5C6E20';
wwv_flow_imp.g_varchar2_table(60) := '2020202020202076617220636F6C756D6E203D207569772E5F656C656D656E74732E2469672E696E7465726163746976654772696428276F7074696F6E27292E636F6E6669672E636F6C756D6E732E66696C7465722866756E6374696F6E2028636F6C75';
wwv_flow_imp.g_varchar2_table(61) := '6D6E29207B5C6E2020202020202020202072657475726E20636F6C756D6E2E7374617469634964203D3D3D207569772E6F7074696F6E732E6974656D4E616D653B5C6E20202020202020207D295B305D3B5C6E20202020202020202F2F20676F20746F20';
wwv_flow_imp.g_varchar2_table(62) := '6F75722063656C6C20616E6420666F6375732069742020202020205C6E20202020202020207569772E5F656C656D656E74732E24677269642E76696577242E677269642827676F746F43656C6C272C207265636F726449642C20636F6C756D6E2E6E616D';
wwv_flow_imp.g_varchar2_table(63) := '65293B5C6E20202020202020207569772E5F656C656D656E74732E24677269642E666F63757328293B5C6E2020202020207D5C6E202020202020636174636820286529207B5C6E2020202020202020636F6E736F6C652E7761726E285C22546865726520';
wwv_flow_imp.g_varchar2_table(64) := '776572652070726F626C656D7320747279696E6720746F207265666F637573206F6E207468652063656C6C206265696E67206564697465645C22293B5C6E2020202020207D5C6E5C6E202020207D20656C7365207B5C6E2020202020202F2F2077652061';
wwv_flow_imp.g_varchar2_table(65) := '7265206E6F7420696E206120677269642C20736F20666F63757320746865206974656D20746861742063616C6C65642075735C6E2020202020207569772E5F6974656D242E747269676765722827666F63757327293B5C6E202020207D5C6E20207D2C5C';
wwv_flow_imp.g_varchar2_table(66) := '6E5C6E5C6E5C6E5C6E20205F696E6974417065784974656D3A2066756E6374696F6E202829207B5C6E2020202076617220756977203D20746869733B5C6E5C6E202020207569772E6C6F67285C225F696E6974417065784974656D5C222C205C22526567';
wwv_flow_imp.g_varchar2_table(67) := '6973746572696E67207769746820617065782E6974656D2E63726561746520666F72205C22202B207569772E6F7074696F6E732E6974656D4E616D65293B5C6E202020202F2F2053657420616E64206765742076616C7565207669612061706578206675';
wwv_flow_imp.g_varchar2_table(68) := '6E6374696F6E735C6E20202020617065782E6974656D2E637265617465287569772E6F7074696F6E732E6974656D4E616D652C207B5C6E5C6E2020202020202073657456616C75653A2066756E6374696F6E287056616C75652C2070446973706C617956';
wwv_flow_imp.g_varchar2_table(69) := '616C756529207B5C6E202020202020202020207569772E6C6F6728205C22617065782E6974656D2E73657456616C75655C222C207056616C75652C2070446973706C617956616C7565293B5C6E5C6E202020202020202020207569772E5F696E69744461';
wwv_flow_imp.g_varchar2_table(70) := '74614A534F4E284A534F4E2E7061727365287056616C7565207C7C205C227B7D5C2229293B5C6E5C6E202020202020202020206966202870446973706C617956616C7565207C7C20217056616C7565207C7C207056616C75652E6C656E677468203D3D3D';
wwv_flow_imp.g_varchar2_table(71) := '203029207B5C6E20202020202020202020202020202F2F20656D707479207056616C75652C2077652073686F756C6420626520646F6E655C6E20202020202020202020202020207569772E5F6974656D242E76616C28293B5C6E20202020202020202020';
wwv_flow_imp.g_varchar2_table(72) := '7D20656C7365207B5C6E20202020202020202020202020202F2F204E4F5420656D707479207056616C75655C6E2020202020202020202020202020696620282170446973706C617956616C756529207B5C6E202020202020202020202020202020207044';
wwv_flow_imp.g_varchar2_table(73) := '6973706C617956616C7565203D207569772E5F676574544C287569772E6F7074696F6E732E6C616E67293B5C6E20202020202020202020202020207D5C6E5C6E20202020202020202020202020207569772E5F6974656D242E76616C2870446973706C61';
wwv_flow_imp.g_varchar2_table(74) := '7956616C7565293B5C6E202020202020202020207D5C6E5C6E202020202020207D2C5C6E2020202020202067657456616C75653A2066756E6374696F6E2829207B5C6E2020202020202020202072657475726E204A534F4E2E737472696E676966792875';
wwv_flow_imp.g_varchar2_table(75) := '69772E5F76616C7565732E646174614A534F4E293B5C6E202020202020207D2C5C6E20202020202020736574466F6375733A2066756E6374696F6E2829207B5C6E202020202020202020207569772E5F6974656D242E74726967676572285C22666F6375';
wwv_flow_imp.g_varchar2_table(76) := '735C22293B5C6E202020202020207D2C5C6E20202020202020656E61626C653A2066756E6374696F6E2829207B5C6E202020202020202020207569772E656E61626C6528293B5C6E202020202020207D2C5C6E2020202020202064697361626C653A2066';
wwv_flow_imp.g_varchar2_table(77) := '756E6374696F6E2829207B5C6E202020202020202020207569772E64697361626C6528293B5C6E202020202020207D2C5C6E20202020202020676574506F70757053656C6563746F723A2066756E6374696F6E2829207B5C6E2020202020202020202072';
wwv_flow_imp.g_varchar2_table(78) := '657475726E207569772E5F76616C7565732E706F70757053454C3B5C6E202020202020207D2C5C6E20202020202020646973706C617956616C7565466F723A2066756E6374696F6E20287056616C756529207B5C6E202020202020202020207661722070';
wwv_flow_imp.g_varchar2_table(79) := '7265766A746C4A534F4E203D207B7D2C5C6E20202020202020202020202020206A746C4A534F4E203D207B7D2C5C6E202020202020202020202020202072657475726E56616C75653B5C6E202020202020202020202F2F205468652049472063616C6C73';
wwv_flow_imp.g_varchar2_table(80) := '207468697320636F646520746F207365742074686520696E697469616C20646973706C61792076616C7565735C6E202020202020202020207569772E6C6F67285C22617065782E6974656D2E646973706C617956616C7565466F725C222C207056616C75';
wwv_flow_imp.g_varchar2_table(81) := '65293B5C6E20202020202020202020696620287056616C756529207B5C6E202020202020202020202020747279207B202F2F206A7573742070726F7465637420757320696620746865204A534F4E20697320696E76616C69645C6E202020202020202020';
wwv_flow_imp.g_varchar2_table(82) := '20202020206A746C4A534F4E203D204A534F4E2E7061727365287056616C7565293B5C6E2020202020202020202020207D5C6E202020202020202020202020636174636820286529207B5C6E2020202020202020202020207D5C6E5C6E5C6E2020202020';
wwv_flow_imp.g_varchar2_table(83) := '20202020207D5C6E20202020202020202020707265766A746C4A534F4E203D207569772E5F76616C7565732E646174614A534F4E3B20202F2F2073746F72652074686520707265762076616C75655C6E2020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(84) := '2020202020202020202020202020202020202020202020202020202F2F20646973706C617956616C7565466F722073686F756C64204E4F54206368616E67652073746174655C6E202020202020202020207569772E5F696E6974446174614A534F4E286A';
wwv_flow_imp.g_varchar2_table(85) := '746C4A534F4E293B5C6E2020202020202020202072657475726E56616C7565203D207569772E5F676574544C287569772E6F7074696F6E732E6C616E67293B5C6E202020202020202020207569772E5F696E6974446174614A534F4E28707265766A746C';
wwv_flow_imp.g_varchar2_table(86) := '4A534F4E293B2020202020202F2F20726573746F7265207468652076616C75655C6E5C6E2020202020202020202072657475726E2072657475726E56616C75653B5C6E202020202020207D5C6E202020207D293B5C6E5C6E20207D2C5C6E5C6E5C6E5C6E';
wwv_flow_imp.g_varchar2_table(87) := '20202F2F205468616E6B20796F7520746F204D656E6E6F20486F6F67656E64696A6B20666F72207468697320636F64655C6E20202F2F2068747470733A2F2F6769746875622E636F6D2F6D656E6E6F6F6F2F6F72636C617065782D6D6F64616C2D6C6F76';
wwv_flow_imp.g_varchar2_table(88) := '5C6E20205F616464435353546F546F704C6576656C3A2066756E6374696F6E202829207B5C6E2020202076617220756977203D20746869733B5C6E202020202F2F204353532066696C6520697320616C776179732070726573656E74207768656E207468';
wwv_flow_imp.g_varchar2_table(89) := '652063757272656E742077696E646F772069732074686520746F702077696E646F772C20736F20646F206E6F7468696E675C6E202020206966202877696E646F77203D3D3D2077696E646F772E746F7029207B5C6E20202020202072657475726E3B5C6E';
wwv_flow_imp.g_varchar2_table(90) := '202020207D5C6E202020207661722063737353656C6563746F72203D20276C696E6B5B72656C3D5C227374796C6573686565745C225D5B687265662A3D5C226A746C5F6974656D5C225D273B5C6E5C6E202020202F2F20436865636B2069662066696C65';
wwv_flow_imp.g_varchar2_table(91) := '2065786973747320696E20746F702077696E646F775C6E20202020696620287569772E5F746F70417065782E6A51756572792863737353656C6563746F72292E6C656E677468203D3D3D203029207B5C6E2020202020207569772E5F746F70417065782E';
wwv_flow_imp.g_varchar2_table(92) := '6A517565727928276865616427292E617070656E6428242863737353656C6563746F72292E636C6F6E652829293B5C6E202020207D5C6E20207D2C5C6E5C6E5C6E20205F696E6974456C656D656E74733A2066756E6374696F6E2829207B5C6E20202020';
wwv_flow_imp.g_varchar2_table(93) := '2076617220756977203D20746869733B5C6E5C6E20202020207569772E5F656C656D656E74732E2477696E646F77203D207569772E5F746F70417065782E6A51756572792877696E646F77293B5C6E20202020207569772E5F656C656D656E74732E2464';
wwv_flow_imp.g_varchar2_table(94) := '6F63756D656E74203D207569772E5F746F70417065782E6A51756572792877696E646F772E746F702E646F63756D656E74293B5C6E20202020207569772E5F656C656D656E74732E24626F6479203D207569772E5F746F70417065782E6A517565727928';
wwv_flow_imp.g_varchar2_table(95) := '77696E646F772E746F702E646F63756D656E742E626F6479293B5C6E5C6E20207D2C5C6E5C6E5C6E20205F696E69744469616C6F67456C656D656E74733A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C';
wwv_flow_imp.g_varchar2_table(96) := '6E20202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E74203D207569772E5F746F70417065782E6A517565727928276469762E6A746C6974656D2D636F6E74656E7427293B5C6E20202020207569772E5F656C656D656E7473';
wwv_flow_imp.g_varchar2_table(97) := '2E2473617665427574746F6E203D207569772E5F746F70417065782E6A51756572792827627574746F6E2E6A746C6974656D2D736176652D627574746F6E27293B5C6E20202020207569772E5F656C656D656E74732E2463616E63656C427574746F6E20';
wwv_flow_imp.g_varchar2_table(98) := '3D207569772E5F746F70417065782E6A51756572792827627574746F6E2E6A746C6974656D2D63616E63656C2D627574746F6E27293B5C6E5C6E20207D2C5C6E5C6E5C6E20205F696E697442617365456C656D656E74733A2066756E6374696F6E282920';
wwv_flow_imp.g_varchar2_table(99) := '7B5C6E202020202076617220756977203D20746869733B5C6E5C6E20202020207569772E6C6F6728205C225F696E697442617365456C656D656E74735C22293B5C6E20202020207569772E656C6F6728205C22656C656D656E745C222C207569772E656C';
wwv_flow_imp.g_varchar2_table(100) := '656D656E74293B5C6E5C6E20202020207569772E5F76616C7565732E6669656C6453697A65203D207569772E6F7074696F6E732E6974656D54797065203D3D3D205C22544558545C223F207569772E5F6974656D242E61747472285C2273697A655C2229';
wwv_flow_imp.g_varchar2_table(101) := '203A207569772E5F6974656D242E61747472285C22636F6C735C22293B5C6E2020202020696620287569772E6F7074696F6E732E6974656D54797065203D3D3D205C2254455854415245415C2229207B5C6E202020202020207569772E5F76616C756573';
wwv_flow_imp.g_varchar2_table(102) := '2E6669656C64526F7773203D207569772E5F6974656D242E61747472285C22726F77735C22293B5C6E20202020207D5C6E20202020207569772E5F76616C7565732E6669656C644D61784C656E677468203D207569772E5F6974656D242E61747472285C';
wwv_flow_imp.g_varchar2_table(103) := '226D61786C656E6774685C22293B5C6E5C6E20202020202F2F205374617274696E67207769746820415045582031382E3120746865206974656D2073657420697320746865206974656D5772617070657220636C6173735C6E20202020207569772E5F65';
wwv_flow_imp.g_varchar2_table(104) := '6C656D656E74732E246974656D736574203D207569772E5F6974656D242E706172656E7428293B5C6E20202020207569772E5F656C656D656E74732E246D6C73427574746F6E203D207569772E5F656C656D656E74732E246974656D7365742E66696E64';
wwv_flow_imp.g_varchar2_table(105) := '2827627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E27293B5C6E20207D2C5C6E5C6E5C6E20202F2F205F73796E634C616E67756167654D617020696E69746973207468652062617365206461746120666F72205F676574544C5C6E20202F';
wwv_flow_imp.g_varchar2_table(106) := '2F20497420637265617465732061206D6170206F66206C616E677561676520636F64657320616E642074686569722076616C75657320666F722066617374206163636573735C6E20205F73796E634C616E67756167654D61703A2066756E6374696F6E28';
wwv_flow_imp.g_varchar2_table(107) := '29207B5C6E202020202076617220756977203D20746869732C5C6E20202020202020202069203D206E756C6C2C5C6E20202020202020202074616773203D207B7D3B5C6E5C6E20202020207569772E6C6F6728205C225F73796E634C616E67756167654D';
wwv_flow_imp.g_varchar2_table(108) := '61705C22293B5C6E202020202074616773203D207569772E5F76616C7565732E646174614A534F4E3B5C6E5C6E20202020202F2F20687474703A2F2F6D617474736E696465722E636F6D2F686F772D746F2D656666696369656E746C792D736561726368';
wwv_flow_imp.g_varchar2_table(109) := '2D612D6A736F6E2D61727261792F5C6E20202020207569772E5F76616C7565732E7461674D6170203D207B7D3B5C6E2020202020666F72202869203D20303B20746167732E6C656E677468203E20693B2069202B3D203129207B5C6E2020202020202020';
wwv_flow_imp.g_varchar2_table(110) := '207569772E5F76616C7565732E7461674D61705B746167735B695D2E6C5D203D20746167735B695D2E746C3B5C6E2020202020202020202F2F20636F6E736F6C652E6C6F6728692C205C225B5C22202B20746167735B695D2E6C202B205C225D203D205C';
wwv_flow_imp.g_varchar2_table(111) := '222C20746167735B695D2E746C295C6E20202020207D5C6E2020202020205C6E20207D2C5C6E5C6E5C6E20202F2F2067657420746865206C616E67756167652076616C756520666F72206120676976656E206C616E677561676520636F64655C6E20205F';
wwv_flow_imp.g_varchar2_table(112) := '676574544C3A2066756E6374696F6E286C616E67436F646529207B5C6E202020202076617220756977203D20746869733B5C6E202020202072657475726E207569772E5F76616C7565732E7461674D61705B6C616E67436F64655D3B5C6E20207D2C5C6E';
wwv_flow_imp.g_varchar2_table(113) := '5C6E5C6E5C6E20202F2F20657870656374732061206A746C4A534F4E20737472756374757265206F7220616E20656D707479206F626A6563745C6E20205F696E6974446174614A534F4E3A2066756E6374696F6E286A746C4A534F4E297B5C6E20202020';
wwv_flow_imp.g_varchar2_table(114) := '2076617220756977203D20746869732C5C6E2020202020202020206A736F6E44617461203D205B5D2C5C6E202020202020202020696E7075745F64617461203D206A746C4A534F4E207C7C207B7D3B5C6E5C6E2020202020202020207569772E6C6F6728';
wwv_flow_imp.g_varchar2_table(115) := '5C225F696E6974446174614A534F4E5C22293B5C6E2020202020202020207569772E656C6F67287B696E7075745F646174617D293B5C6E5C6E202020202069662028617065782E6A51756572792E6973456D7074794F626A65637428696E7075745F6461';
wwv_flow_imp.g_varchar2_table(116) := '74612929207B5C6E20202020202020207569772E6C6F67285C22496E697469616C697A696E67207769746820656D7074792076616C75655C22293B5C6E5C6E20202020202020202F2F20546865207265636F726420697320656D70747920736F20776520';
wwv_flow_imp.g_varchar2_table(117) := '6275696C642061205C6E20202020202020202F2F206275696C64204A534F4E207769746820746869732073747275637475726520746F20736565642069743A5C6E20202020202020202F2F20205B207B5C226C5C223A205C2275735C222C205C22746C5C';
wwv_flow_imp.g_varchar2_table(118) := '223A205C2250726F6A65637420416E616C797369735C227D5C6E20202020202020202F2F20202C207B5C226C5C223A205C2266725C222C205C22746C5C223A205C22416E616C7973652064652070726F6A65745C227D5C6E20202020202020202F2F2020';
wwv_flow_imp.g_varchar2_table(119) := '2C207B5C226C5C223A205C2265735C222C205C22746C5C223A205C22416E616C697369732064652070726F6A6563746F5C227D5D5C6E20202020202020207569772E5F76616C7565732E6C616E6775616765732E666F72456163682866756E6374696F6E';
wwv_flow_imp.g_varchar2_table(120) := '286C29207B5C6E20202020202020202020206A736F6E446174612E70757368287B5C226C5C223A206C2C205C22746C5C223A205C225C227D293B5C6E20202020202020207D293B5C6E5C6E20202020202020207569772E5F76616C7565732E646174614A';
wwv_flow_imp.g_varchar2_table(121) := '534F4E203D206A736F6E446174613B5C6E20202020202020207569772E5F76616C7565732E6E65775265636F7264203D20747275653B5C6E20202020207D5C6E2020202020656C7365207B5C6E202020202020207569772E5F76616C7565732E64617461';
wwv_flow_imp.g_varchar2_table(122) := '4A534F4E203D20696E7075745F646174613B5C6E202020202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B5C6E20202020207D5C6E5C6E20202020207569772E5F73796E634C616E67756167654D617028293B5C6E5C';
wwv_flow_imp.g_varchar2_table(123) := '6E20207D2C5C6E5C6E5C6E20202F2F204D61696E7461696E7320746865204A544C204A534F4E206461746120696E2073796E632E5C6E20202F2F206966206372656174696E672061206E6577207265636F72642C20616C6C2074686520656E7465726564';
wwv_flow_imp.g_varchar2_table(124) := '2076616C75657320617265207573656420666F7220414C4C20746865206C616E6775616765735C6E20202F2F206F74686572776973652074686520656E74657265642076616C756520676F657320696E746F2074686520637572725F6C616E675F696E64';
wwv_flow_imp.g_varchar2_table(125) := '6578206F6E6C795C6E20205F73796E634A534F4E646174613A2066756E6374696F6E286576656E744F626A29207B5C6E20202020202F2F2076617220756977203D206576656E744F626A2E646174612E7569772C5C6E2020202020766172207569773B5C';
wwv_flow_imp.g_varchar2_table(126) := '6E5C6E202020202069662028747970656F66206576656E744F626A20213D205C22756E646566696E65645C2229207B5C6E20202020202020202F2F20776520776572652063616C6C2066726F6D20616E206576656E745C6E202020202020202075697720';
wwv_flow_imp.g_varchar2_table(127) := '3D206576656E744F626A2E646174612E7569773B5C6E20202020207D5C6E2020202020656C7365207B5C6E20202020202020202F2F206469726563742063616C6C5C6E2020202020202020756977203D20746869733B5C6E20202020207D5C6E20202020';
wwv_flow_imp.g_varchar2_table(128) := '207569772E6C6F67285C225F73796E634A534F4E646174615C22293B5C6E5C6E2020202020696620287569772E5F76616C7565732E6E65775265636F726429207B5C6E20202020202020202F2F204F6E206E6577207265636F72642077652077616E7420';
wwv_flow_imp.g_varchar2_table(129) := '746F207361766520746865206E657720656E74657265642076616C756520696E746F2074686520414C4C207468655C6E20202020202020202F2F207265636F72647320696E20746865204A534F4E207374727563747572655C6E2020202020202020666F';
wwv_flow_imp.g_varchar2_table(130) := '7220287661722069203D207569772E5F76616C7565732E746F74616C4C616E677561676573202D20313B2069203E3D20303B20692D2D29207B5C6E202020202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E746C203D207569';
wwv_flow_imp.g_varchar2_table(131) := '772E5F6974656D242E76616C28293B5C6E20202020202020207D5C6E20202020207D5C6E2020202020656C7365207B5C6E20202020202020202F2F207361766520746865206E6577207465787420696E746F20746865204A534F4E207374727563747572';
wwv_flow_imp.g_varchar2_table(132) := '6520666F72207468652063757272656E74206C616E67756167655C6E20202020202020207569772E5F76616C7565732E646174614A534F4E5B7569772E5F76616C7565732E637572725F6C616E675F696E6465785D2E746C203D207569772E5F6974656D';
wwv_flow_imp.g_varchar2_table(133) := '242E76616C28293B5C6E20202020207D5C6E5C6E20202020207569772E5F73796E634C616E67756167654D617028293B5C6E20207D2C5C6E5C6E5C6E5C6E20205F696E69744469616C6F67427574746F6E733A2066756E6374696F6E2829207B5C6E2020';
wwv_flow_imp.g_varchar2_table(134) := '20202076617220756977203D20746869733B5C6E5C6E20202020207569772E5F656C656D656E74732E2463616E63656C427574746F6E5C6E20202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E64';
wwv_flow_imp.g_varchar2_table(135) := '6C6543616E63656C427574746F6E436C69636B293B5C6E5C6E20202020207569772E5F656C656D656E74732E2473617665427574746F6E5C6E20202020202020202E62696E642827636C69636B272C207B7569773A207569777D2C207569772E5F68616E';
wwv_flow_imp.g_varchar2_table(136) := '646C6553617665427574746F6E436C69636B293B5C6E5C6E20207D2C5C6E5C6E5C6E5C6E20205F68616E646C6543616E63656C427574746F6E436C69636B3A2066756E6374696F6E286576656E744F626A29207B5C6E202020202076617220756977203D';
wwv_flow_imp.g_varchar2_table(137) := '206576656E744F626A2E646174612E7569773B5C6E5C6E20202020202F2F20696620746865206469616C6F67206F70656E732C207765277265206E6F742061206E6577207265636F726420616E79206D6F72655C6E20202020207569772E5F76616C7565';
wwv_flow_imp.g_varchar2_table(138) := '732E6E65775265636F7264203D2066616C73653B5C6E5C6E20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B202F2F20746869732073686F756C64206361736361646520746F2072656D6F7665';
wwv_flow_imp.g_varchar2_table(139) := '20746865206469616C6F675C6E5C6E20207D2C5C6E5C6E5C6E5C6E20205F68616E646C6553617665427574746F6E436C69636B3A2066756E6374696F6E286576656E744F626A29207B5C6E202020202076617220756977203D206576656E744F626A2E64';
wwv_flow_imp.g_varchar2_table(140) := '6174612E7569772C5C6E202020202020202020646973706C61795F76616C75653B5C6E5C6E20202020207569772E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E6428272E6A746C6974656D2D76616C756527292E656163682866';
wwv_flow_imp.g_varchar2_table(141) := '756E6374696F6E28692C656C297B5C6E20202020202020202F2F206C6F6F70207468726F75676820616C6C206469616C6F6720656C656D656E747320616E642073746F7265207472616E736C6174696F6E735C6E20202020202020202F2F206261636B20';
wwv_flow_imp.g_varchar2_table(142) := '696E746F2074686520646174614A534F4E207374727563747572655C6E5C6E20202020202020202F2F207569772E6C6F672869202B205C22285C22202B20656C2E646174617365742E6C616E67202B205C22293A5C22202B20656C2E76616C7565293B5C';
wwv_flow_imp.g_varchar2_table(143) := '6E5C6E20202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E6C203D20656C2E646174617365742E6C616E673B5C6E20202020202020207569772E5F76616C7565732E646174614A534F4E5B695D2E746C203D20656C2E76616C';
wwv_flow_imp.g_varchar2_table(144) := '75653B5C6E2020202020202020696620287569772E5F76616C7565732E637572725F6C616E675F696E646578203D3D3D206929207B5C6E2020202020202020202020646973706C61795F76616C7565203D20656C2E76616C75653B5C6E20202020202020';
wwv_flow_imp.g_varchar2_table(145) := '207D5C6E5C6E20202020207D293B5C6E5C6E20202020207569772E5F73796E634C616E67756167654D617028293B5C6E5C6E20202020202F2F20776527726520646F6E65205C22736176696E675C22206261636B2066726F6D20746865206469616C6F67';
wwv_flow_imp.g_varchar2_table(146) := '2C20636C65617220746865206E65775265636F726420666C61675C6E20202020207569772E5F76616C7565732E6E65775265636F7264203D2066616C73653B5C6E5C6E20202020207569772E5F6974656D242E76616C28646973706C61795F76616C7565';
wwv_flow_imp.g_varchar2_table(147) := '293B5C6E20202020207569772E5F7369676E616C4368616E676528293B5C6E5C6E20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B202F2F20746869732073686F756C64206361736361646520';
wwv_flow_imp.g_varchar2_table(148) := '746F2072656D6F766520746865206469616C6F675C6E20207D2C5C6E5C6E5C6E20205F7369676E616C4368616E67653A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E20202020202F2F204E65656420';
wwv_flow_imp.g_varchar2_table(149) := '746F2075736520617065782E6A517565727920666F7220746865206576656E747320746F207265676973746572207769746820746865204441206672616D65776F726B5C6E2020202020617065782E6A5175657279287569772E5F6974656D245B305D29';
wwv_flow_imp.g_varchar2_table(150) := '2E7472696767657228276368616E676527293B5C6E20207D2C5C6E5C6E5C6E20205F68616E646C654F70656E436C69636B3A2066756E6374696F6E286576656E744F626A29207B5C6E202020202076617220756977203D206576656E744F626A2E646174';
wwv_flow_imp.g_varchar2_table(151) := '612E7569773B5C6E5C6E20202020207569772E6C6F67285C225F68616E646C654F70656E436C69636B5C22293B5C6E5C6E20202020207569772E5F73796E634A534F4E64617461286576656E744F626A293B5C6E20202020207569772E5F73686F774469';
wwv_flow_imp.g_varchar2_table(152) := '616C6F6728293B5C6E20207D2C5C6E5C6E5C6E20205F73686F774469616C6F673A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869732C5C6E2020202020202020204449414C4F475F434C415353203D202775692D6469';
wwv_flow_imp.g_varchar2_table(153) := '616C6F67272C20202F2F2077652070726566657220697420746F202775692D6469616C6F672D2D617065782720746F2061766F69642072652D63656E746572696E675C6E2020202020202020206C616E675461626C652C5C6E2020202020202020206375';
wwv_flow_imp.g_varchar2_table(154) := '72725F6C616E67203D207569772E5F76616C7565732E637572725F6C616E675F696E6465782C5C6E2020202020202020206469616C6F67506F736974696F6E2C5C6E2020202020202020206469616C6F6748746D6C3B5C6E5C6E20202020207569772E6C';
wwv_flow_imp.g_varchar2_table(155) := '6F67285C225F73686F774469616C6F675C22293B5C6E5C6E5C6E2020202020696620287569772E5F76616C7565732E636F6E74726F6C6C65724D6F6465207C7C2021617065782E6A51756572792E6973456D7074794F626A656374287569772E5F656C65';
wwv_flow_imp.g_varchar2_table(156) := '6D656E74732E24677269642929207B5C6E20202020202020207569772E6C6F6728277765206469646E5C5C277420676574206120686F6C64206F662074686520677269642C206D617962652074727920616761696E27293B5C6E20202020202020207569';
wwv_flow_imp.g_varchar2_table(157) := '772E5F696E697447726964436F6E66696728293B5C6E20202020207D5C6E5C6E20202020206C616E675461626C65203D205C6E2020202020202020202020273C7461626C6520636C6173733D5C22742D5265706F72742D7265706F72745C222073756D6D';
wwv_flow_imp.g_varchar2_table(158) := '6172793D5C22417661696C61626C65205472616E736C6174696F6E735C223E5C5C6E27202B5C6E202020202020202020202027203C74723E5C5C6E27202B5C6E20202020202020202020202720203C746820636C6173733D5C22742D5265706F72742D63';
wwv_flow_imp.g_varchar2_table(159) := '6F6C486561645C223E27202B207569772E5F76616C7565732E6D657373616765732E6C616E67756167654C6162656C202B20273C2F74683E27202B5C6E20202020202020202020202720203C746820636C6173733D5C22742D5265706F72742D636F6C48';
wwv_flow_imp.g_varchar2_table(160) := '65616420752D744C5C223E27202B207569772E5F76616C7565732E6D657373616765732E6C616E677561676556616C7565202B20273C2F74683E27202B5C6E202020202020202020202027203C2F74723E5C5C6E273B5C6E20202020202020202020202F';
wwv_flow_imp.g_varchar2_table(161) := '2F2027203C74723E5C5C6E273B5C6E5C6E2020202020242E65616368287569772E5F76616C7565732E6C616E6775616765732C2066756E6374696F6E2820696E6465782C206C616E672029207B5C6E202020202020206C616E675461626C65202B3D5C6E';
wwv_flow_imp.g_varchar2_table(162) := '2020202020202027203C747227202B2028637572725F6C616E673D3D696E6465783F202720636C6173733D5C2273656C65637465645C22273A272729202B20273E5C5C6E27202B5C6E202020202020202720203C746420636C6173733D5C22742D526570';
wwv_flow_imp.g_varchar2_table(163) := '6F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D74435C223E27202B20617065782E7574696C2E65736361706548544D4C41747472286C616E6729202B20273C2F74643E27202B5C6E202020202020202720203C746420';
wwv_flow_imp.g_varchar2_table(164) := '636C6173733D5C22742D5265706F72742D63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D744C5C223E273B5C6E20202020202020696620287569772E6F7074696F6E732E6974656D54797065203D3D3D205C22544558545C2229';
wwv_flow_imp.g_varchar2_table(165) := '207B5C6E2020202020202020206C616E675461626C65202B3D5C6E20202020202020202027202020203C696E70757420747970653D5C22746578745C2220636C6173733D5C22746578745F6669656C6420617065782D6974656D2D74657874206A746C69';
wwv_flow_imp.g_varchar2_table(166) := '74656D2D76616C75655C2220646174612D6C616E673D5C2227202B206C616E67202B20275C222076616C75653D5C2227202B20617065782E7574696C2E65736361706548544D4C41747472287569772E5F676574544C286C616E672929202B20275C2220';
wwv_flow_imp.g_varchar2_table(167) := '73697A653D5C2227202B207569772E5F76616C7565732E6669656C6453697A65202B20275C22206D61786C656E6774683D5C2227202B207569772E5F76616C7565732E6669656C644D61784C656E677468202B20275C223E3C2F74643E273B5C6E202020';
wwv_flow_imp.g_varchar2_table(168) := '202020207D5C6E20202020202020656C7365207B5C6E2020202020202020206C616E675461626C65202B3D5C6E20202020202020202027202020203C746578746172656120636C6173733D5C22746578746172656120617065782D6974656D2D74657874';
wwv_flow_imp.g_varchar2_table(169) := '61726561206A746C6974656D2D76616C75655C2220646174612D6C616E673D5C2227202B206C616E67202B20275C2227202B5C6E20202020202020202020202020202720636F6C733D5C2227202B207569772E5F76616C7565732E6669656C6453697A65';
wwv_flow_imp.g_varchar2_table(170) := '202B20275C2220726F77733D5C2227202B207569772E5F76616C7565732E6669656C64526F7773202B20275C2227202B205C6E202020202020202020202020202027206D61786C656E6774683D5C2227202B207569772E5F76616C7565732E6669656C64';
wwv_flow_imp.g_varchar2_table(171) := '4D61784C656E677468202B20275C2227202B205C6E2020202020202020202020202020273E27202B20617065782E7574696C2E65736361706548544D4C41747472287569772E5F676574544C286C616E672929202B20273C2F74657874617265613E273B';
wwv_flow_imp.g_varchar2_table(172) := '5C6E202020202020207D5C6E5C6E202020202020206C616E675461626C65202B3D5C6E202020202020202027203C2F74723E5C5C6E273B5C6E20202020207D293B5C6E20202020206C616E675461626C65202B3D5C6E2020202020273C2F7461626C653E';
wwv_flow_imp.g_varchar2_table(173) := '5C5C6E273B5C6E5C6E2020202020206469616C6F6748746D6C203D5C6E2020202020202020202020273C64697620636C6173733D5C2227202B207569772E5F76616C7565732E706F707570436C617373202B20275C223E3C64697620636C6173733D5C22';
wwv_flow_imp.g_varchar2_table(174) := '6A746C6974656D2D636F6E7461696E65722075692D7769646765745C223E5C5C6E27202B5C6E20202020202020202020202720203C64697620636C6173733D5C226A746C6974656D2D627574746F6E2D636F6E7461696E65725C223E5C5C6E27202B5C6E';
wwv_flow_imp.g_varchar2_table(175) := '20202020202020202020202720202020203C627574746F6E20636C6173733D5C226A746C6974656D2D63616E63656C2D627574746F6E20742D427574746F6E5C223E27202B5C6E202020202020202020202027202020202020203C7370616E20636C6173';
wwv_flow_imp.g_varchar2_table(176) := '733D5C22742D427574746F6E2D6C6162656C5C223E27202B207569772E5F76616C7565732E6D657373616765732E63616E63656C427574746F6E202B20273C2F7370616E3E27202B5C6E20202020202020202020202F2F2027202020202020203C737061';
wwv_flow_imp.g_varchar2_table(177) := '6E20636C6173733D5C2275692D69636F6E2075692D69636F6E2D636C6F73655C223E3C2F7370616E3E27202B205C6E20202020202020202020202720202020203C2F627574746F6E3E5C5C6E27202B5C6E20202020202020202020202720202020203C62';
wwv_flow_imp.g_varchar2_table(178) := '7574746F6E20636C6173733D5C226A746C6974656D2D736176652D627574746F6E20742D427574746F6E20742D427574746F6E2D2D686F745C223E27202B205C6E202020202020202020202027202020202020203C7370616E20636C6173733D5C22742D';
wwv_flow_imp.g_varchar2_table(179) := '427574746F6E2D6C6162656C5C223E27202B207569772E5F76616C7565732E6D657373616765732E6170706C794368616E676573202B20273C2F7370616E3E27202B5C6E202020202020202020202027202020202020203C7370616E20636C6173733D5C';
wwv_flow_imp.g_varchar2_table(180) := '22742D49636F6E20742D49636F6E2D2D72696768742066612066612D636865636B5C223E3C2F7370616E3E27202B205C6E20202020202020202020202720202020203C2F627574746F6E3E5C5C6E27202B5C6E20202020202020202020202720203C2F64';
wwv_flow_imp.g_varchar2_table(181) := '69763E5C5C6E27202B5C6E20202020202020202020202720203C64697620636C6173733D5C226A746C6974656D2D636F6E74656E745C223E5C5C6E27202B5C6E20202020202020202020202020206C616E675461626C65202B5C6E202020202020202020';
wwv_flow_imp.g_varchar2_table(182) := '20202720203C2F6469763E5C5C6E27202B5C6E2020202020202020202020273C2F6469763E3C2F6469763E5C5C6E273B5C6E5C6E20202020207569772E5F656C656D656E74732E24626F64792E617070656E64286469616C6F6748746D6C293B5C6E5C6E';
wwv_flow_imp.g_varchar2_table(183) := '20202020202F2F2072656164792061206469616C6F6720636F6E7461696E6572206279206372656174696E672061206469765C6E20202020202F2F207569772E5F656C656D656E74732E246469616C6F67203D202428706F70757053454C293B5C6E2020';
wwv_flow_imp.g_varchar2_table(184) := '2020207569772E5F656C656D656E74732E246469616C6F67203D207569772E5F746F70417065782E6A5175657279287569772E5F76616C7565732E706F70757053454C293B5C6E5C6E20202020202F2F206469616C6F67506F736974696F6E203D207569';
wwv_flow_imp.g_varchar2_table(185) := '772E5F6974656D242E6F666673657428293B20202F2F20706F736974696F6E206E65787420746F20746865206974656D5C6E20202020206966202877696E646F77203D3D3D2077696E646F772E746F7029207B5C6E20202020202020206469616C6F6750';
wwv_flow_imp.g_varchar2_table(186) := '6F736974696F6E203D207B206D793A205C226C6566745C222C2061743A205C226C6566742063656E7465725C222C206F663A207569772E5F6974656D245B305D207D3B20202F2F20706F736974696F6E206E65787420746F20746865206974656D5C6E20';
wwv_flow_imp.g_varchar2_table(187) := '202020207D5C6E2020202020656C7365207B5C6E20202020202020202F2F20706F736974696F6E206261736564206F6E20746865206469616C6F67202863656E746572656421295C6E20202020202020206469616C6F67506F736974696F6E203D207B20';
wwv_flow_imp.g_varchar2_table(188) := '6D793A205C2263656E7465722063656E7465725C222C2061743A205C2263656E7465722063656E7465725C222C206F663A207569772E5F746F70417065782E6A517565727928272E272B4449414C4F475F434C415353295B305D207D3B5C6E2020202020';
wwv_flow_imp.g_varchar2_table(189) := '7D5C6E5C6E20202020202F2F206F70656E2063726561746564206469762061732061206469616C6F675C6E20202020207569772E5F656C656D656E74732E246469616C6F672E6469616C6F67287B5C6E202020202020202020636C6F73654F6E45736361';
wwv_flow_imp.g_varchar2_table(190) := '70653A20747275652C5C6E2020202020202020207469746C653A2020202020202020207569772E6F7074696F6E732E6469616C6F675469746C652C5C6E2020202020202020206175746F526573697A653A20202020747275652C5C6E2020202020202020';
wwv_flow_imp.g_varchar2_table(191) := '206D696E57696474683A2020202020203430302C5C6E2020202020202020206D696E4865696768743A20202020203235302C5C6E20202020202020202077696474683A202020202020202020276175746F272C5C6E202020202020202020686569676874';
wwv_flow_imp.g_varchar2_table(192) := '3A2020202020202020276175746F272C5C6E2020202020202020206D6F64616C3A202020202020202020747275652C5C6E2020202020202020206469616C6F67436C6173733A2020204449414C4F475F434C4153532C5C6E202020202020202020706F73';
wwv_flow_imp.g_varchar2_table(193) := '6974696F6E3A2020202020206469616C6F67506F736974696F6E2C5C6E2020202020202020206F70656E3A2066756E6374696F6E2829207B5C6E2020202020202020202020202F2F207569772E5F746F70417065782E6E617669676174696F6E2E626567';
wwv_flow_imp.g_varchar2_table(194) := '696E467265657A655363726F6C6C28293B5C6E2020202020202020202020207569772E5F696E69744469616C6F67456C656D656E747328293B5C6E2020202020202020202020207569772E5F696E69744469616C6F67427574746F6E7328293B5C6E5C6E';
wwv_flow_imp.g_varchar2_table(195) := '2020202020202020202020202F2F20466F637573206F6E207468652066697273742076616C7565206F66207468652063757272656E74206C616E6775616765205C6E2020202020202020202020207569772E5F656C656D656E74732E246469616C6F6743';
wwv_flow_imp.g_varchar2_table(196) := '6F6E74656E742E66696E64282774722E73656C6563746564202E6A746C6974656D2D76616C756527292E747269676765722827666F63757327293B5C6E2020202020202020207D2C5C6E202020202020202020636C6F73653A2066756E6374696F6E2829';
wwv_flow_imp.g_varchar2_table(197) := '207B5C6E5C6E2020202020202020202020202F2F20242874686973292E6469616C6F67282764657374726F7927293B5C6E2020202020202020202020207569772E5F656C656D656E74732E246469616C6F672E72656D6F766528293B5C6E202020202020';
wwv_flow_imp.g_varchar2_table(198) := '2020202020207569772E5F656C656D656E74732E24646F63756D656E742E66696E64287569772E5F76616C7565732E706F70757053454C292E72656D6F766528293B5C6E2020202020202020202020202F2F207569772E5F746F70417065782E6E617669';
wwv_flow_imp.g_varchar2_table(199) := '676174696F6E2E656E64467265657A655363726F6C6C28293B5C6E5C6E2020202020202020202020207569772E5F7265736574466F63757328293B5C6E2020202020202020207D5C6E202020202020207D295C6E202020202020202E6F6E28276B657964';
wwv_flow_imp.g_varchar2_table(200) := '6F776E272C2066756E6374696F6E2865767429207B5C6E2020202020202020202020696620286576742E6B6579436F6465203D3D3D20242E75692E6B6579436F64652E45534341504529207B5C6E2020202020202020202020202020207569772E5F656C';
wwv_flow_imp.g_varchar2_table(201) := '656D656E74732E246469616C6F672E6469616C6F672827636C6F736527293B5C6E20202020202020202020207D202020202020202020202020202020205C6E20202020202020202020206576742E73746F7050726F7061676174696F6E28293B5C6E2020';
wwv_flow_imp.g_varchar2_table(202) := '20202020207D293B5C6E5C6E5C6E20207D2C5C6E5C6E5C6E202064697361626C653A2066756E6374696F6E2829207B5C6E202020202076617220756977203D20746869733B5C6E5C6E2020202020696620287569772E5F76616C7565732E64697361626C';
wwv_flow_imp.g_varchar2_table(203) := '6564203D3D3D2066616C736529207B5C6E20202020202020207569772E5F6974656D245C6E20202020202020202020202E61747472282764697361626C6564272C2764697361626C656427293B5C6E5C6E20202020202020207569772E5F656C656D656E';
wwv_flow_imp.g_varchar2_table(204) := '74732E246D6C73427574746F6E5C6E20202020202020202020202E61747472282764697361626C6564272C2764697361626C656427295C6E20202020202020202020202E756E62696E642827636C69636B272C207569772E5F68616E646C654F70656E43';
wwv_flow_imp.g_varchar2_table(205) := '6C69636B293B5C6E20202020207D5C6E5C6E20202020207569772E5F76616C7565732E64697361626C6564203D20747275653B5C6E20207D2C5C6E5C6E5C6E2020656E61626C653A2066756E6374696F6E2829207B5C6E20202020207661722075697720';
wwv_flow_imp.g_varchar2_table(206) := '3D20746869733B5C6E5C6E2020202020696620287569772E5F76616C7565732E64697361626C6564203D3D3D207472756529207B5C6E202020202020207569772E5F6974656D242E72656D6F766541747472282764697361626C656427293B5C6E202020';
wwv_flow_imp.g_varchar2_table(207) := '202020207569772E5F656C656D656E74732E246D6C73427574746F6E5C6E202020202020202020202E72656D6F766541747472282764697361626C656427295C6E202020202020202020202E62696E642827636C69636B272C207B7569773A207569777D';
wwv_flow_imp.g_varchar2_table(208) := '2C207569772E5F68616E646C654F70656E436C69636B293B5C6E5C6E202020202020207569772E5F76616C7565732E64697361626C6564203D2066616C73653B5C6E20202020207D5C6E20207D5C6E7D293B5C6E225D2C2266696C65223A226A746C5F69';
wwv_flow_imp.g_varchar2_table(209) := '74656D2E6A73227D';
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
wwv_flow_imp.g_varchar2_table(16) := '2229292C652E5F696E6974446174614A534F4E2874292C652E5F76616C7565732E637572725F6C616E675F696E6465783D66756E6374696F6E28652C74297B76617220693D6E756C6C2C613D2D313B666F7228693D303B652E6C656E6774683E6926262D';
wwv_flow_imp.g_varchar2_table(17) := '313D3D613B692B3D3129655B695D2E6C3D3D3D74262628613D69293B72657475726E20617D28652E5F76616C7565732E646174614A534F4E2C652E6F7074696F6E732E6C616E67292C652E5F6974656D242E62696E6428226368616E6765222C7B756977';
wwv_flow_imp.g_varchar2_table(18) := '3A657D2C652E5F73796E634A534F4E64617461292C652E5F656C656D656E74732E24646F63756D656E742E62696E642822617065786265666F7265706167657375626D6974222C7B7569773A657D2C652E5F73796E634A534F4E64617461292C652E5F65';
wwv_flow_imp.g_varchar2_table(19) := '6C656D656E74732E246D6C73427574746F6E2E62696E642822636C69636B222C7B7569773A657D2C652E5F68616E646C654F70656E436C69636B292C652E5F696E6974417065784974656D28292C617065782E6A51756572792877696E646F77292E6F6E';
wwv_flow_imp.g_varchar2_table(20) := '2822696E74657261637469766567726964766965776D6F64656C637265617465222C66756E6374696F6E28742C69297B652E5F696E697447726964436F6E66696728297D297D2C5F696E697447726964436F6E6669673A66756E6374696F6E28297B7661';
wwv_flow_imp.g_varchar2_table(21) := '7220653D746869732C743D617065782E726567696F6E2E66696E64436C6F7365737428652E5F6974656D245B305D293B652E6C6F6728225F696E697447726964436F6E66696722292C652E656C6F6728227569772E5F6974656D24222C652E5F6974656D';
wwv_flow_imp.g_varchar2_table(22) := '24292C652E656C6F672822726567696F6E222C74292C652E5F76616C7565732E636F6E74726F6C6C65724D6F64653F28652E5F656C656D656E74732E2469673D742E77696467657428292E696E7465726163746976654772696428292C652E5F656C656D';
wwv_flow_imp.g_varchar2_table(23) := '656E74732E24677269643D742E77696467657428292E696E746572616374697665477269642822676574566965777322292E677269642C652E656C6F6728225F656C656D656E74732E24677269643A222C652E5F656C656D656E74732E24677269642929';
wwv_flow_imp.g_varchar2_table(24) := '3A652E6C6F6728226E6F7420616E20494722297D2C5F7265736574466F6375733A66756E6374696F6E28297B76617220653D746869733B696628652E6C6F6728225F7265736574466F63757322292C652E5F76616C7565732E636F6E74726F6C6C65724D';
wwv_flow_imp.g_varchar2_table(25) := '6F6465297472797B76617220743D652E5F656C656D656E74732E24677269642E6D6F64656C2E6765745265636F7264496428652E5F656C656D656E74732E24677269642E76696577242E67726964282267657453656C65637465645265636F7264732229';
wwv_flow_imp.g_varchar2_table(26) := '5B305D292C693D652E5F656C656D656E74732E2469672E696E7465726163746976654772696428226F7074696F6E22292E636F6E6669672E636F6C756D6E732E66696C7465722866756E6374696F6E2874297B72657475726E20742E7374617469634964';
wwv_flow_imp.g_varchar2_table(27) := '3D3D3D652E6F7074696F6E732E6974656D4E616D657D295B305D3B652E5F656C656D656E74732E24677269642E76696577242E677269642822676F746F43656C6C222C742C692E6E616D65292C652E5F656C656D656E74732E24677269642E666F637573';
wwv_flow_imp.g_varchar2_table(28) := '28297D63617463682865297B636F6E736F6C652E7761726E2822546865726520776572652070726F626C656D7320747279696E6720746F207265666F637573206F6E207468652063656C6C206265696E672065646974656422297D656C736520652E5F69';
wwv_flow_imp.g_varchar2_table(29) := '74656D242E747269676765722822666F63757322297D2C5F696E6974417065784974656D3A66756E6374696F6E28297B76617220653D746869733B652E6C6F6728225F696E6974417065784974656D222C225265676973746572696E6720776974682061';
wwv_flow_imp.g_varchar2_table(30) := '7065782E6974656D2E63726561746520666F7220222B652E6F7074696F6E732E6974656D4E616D65292C617065782E6974656D2E63726561746528652E6F7074696F6E732E6974656D4E616D652C7B73657456616C75653A66756E6374696F6E28742C69';
wwv_flow_imp.g_varchar2_table(31) := '297B652E6C6F672822617065782E6974656D2E73657456616C7565222C742C69292C652E5F696E6974446174614A534F4E284A534F4E2E706172736528747C7C227B7D2229292C697C7C21747C7C303D3D3D742E6C656E6774683F652E5F6974656D242E';
wwv_flow_imp.g_varchar2_table(32) := '76616C28293A28697C7C28693D652E5F676574544C28652E6F7074696F6E732E6C616E6729292C652E5F6974656D242E76616C286929297D2C67657456616C75653A66756E6374696F6E28297B72657475726E204A534F4E2E737472696E676966792865';
wwv_flow_imp.g_varchar2_table(33) := '2E5F76616C7565732E646174614A534F4E297D2C736574466F6375733A66756E6374696F6E28297B652E5F6974656D242E747269676765722822666F63757322297D2C656E61626C653A66756E6374696F6E28297B652E656E61626C6528297D2C646973';
wwv_flow_imp.g_varchar2_table(34) := '61626C653A66756E6374696F6E28297B652E64697361626C6528297D2C676574506F70757053656C6563746F723A66756E6374696F6E28297B72657475726E20652E5F76616C7565732E706F70757053454C7D2C646973706C617956616C7565466F723A';
wwv_flow_imp.g_varchar2_table(35) := '66756E6374696F6E2874297B76617220692C612C6E3D7B7D3B696628652E6C6F672822617065782E6974656D2E646973706C617956616C7565466F72222C74292C74297472797B6E3D4A534F4E2E70617273652874297D63617463682865297B7D726574';
wwv_flow_imp.g_varchar2_table(36) := '75726E20693D652E5F76616C7565732E646174614A534F4E2C652E5F696E6974446174614A534F4E286E292C613D652E5F676574544C28652E6F7074696F6E732E6C616E67292C652E5F696E6974446174614A534F4E2869292C617D7D297D2C5F616464';
wwv_flow_imp.g_varchar2_table(37) := '435353546F546F704C6576656C3A66756E6374696F6E28297B69662877696E646F77213D3D77696E646F772E746F70297B76617220653D276C696E6B5B72656C3D227374796C657368656574225D5B687265662A3D226A746C5F6974656D225D273B303D';
wwv_flow_imp.g_varchar2_table(38) := '3D3D746869732E5F746F70417065782E6A51756572792865292E6C656E6774682626746869732E5F746F70417065782E6A517565727928226865616422292E617070656E6428242865292E636C6F6E652829297D7D2C5F696E6974456C656D656E74733A';
wwv_flow_imp.g_varchar2_table(39) := '66756E6374696F6E28297B746869732E5F656C656D656E74732E2477696E646F773D746869732E5F746F70417065782E6A51756572792877696E646F77292C746869732E5F656C656D656E74732E24646F63756D656E743D746869732E5F746F70417065';
wwv_flow_imp.g_varchar2_table(40) := '782E6A51756572792877696E646F772E746F702E646F63756D656E74292C746869732E5F656C656D656E74732E24626F64793D746869732E5F746F70417065782E6A51756572792877696E646F772E746F702E646F63756D656E742E626F6479297D2C5F';
wwv_flow_imp.g_varchar2_table(41) := '696E69744469616C6F67456C656D656E74733A66756E6374696F6E28297B746869732E5F656C656D656E74732E246469616C6F67436F6E74656E743D746869732E5F746F70417065782E6A517565727928226469762E6A746C6974656D2D636F6E74656E';
wwv_flow_imp.g_varchar2_table(42) := '7422292C746869732E5F656C656D656E74732E2473617665427574746F6E3D746869732E5F746F70417065782E6A51756572792822627574746F6E2E6A746C6974656D2D736176652D627574746F6E22292C746869732E5F656C656D656E74732E246361';
wwv_flow_imp.g_varchar2_table(43) := '6E63656C427574746F6E3D746869732E5F746F70417065782E6A51756572792822627574746F6E2E6A746C6974656D2D63616E63656C2D627574746F6E22297D2C5F696E697442617365456C656D656E74733A66756E6374696F6E28297B76617220653D';
wwv_flow_imp.g_varchar2_table(44) := '746869733B652E6C6F6728225F696E697442617365456C656D656E747322292C652E656C6F672822656C656D656E74222C652E656C656D656E74292C652E5F76616C7565732E6669656C6453697A653D2254455854223D3D3D652E6F7074696F6E732E69';
wwv_flow_imp.g_varchar2_table(45) := '74656D547970653F652E5F6974656D242E61747472282273697A6522293A652E5F6974656D242E617474722822636F6C7322292C225445585441524541223D3D3D652E6F7074696F6E732E6974656D54797065262628652E5F76616C7565732E6669656C';
wwv_flow_imp.g_varchar2_table(46) := '64526F77733D652E5F6974656D242E617474722822726F77732229292C652E5F76616C7565732E6669656C644D61784C656E6774683D652E5F6974656D242E6174747228226D61786C656E67746822292C652E5F656C656D656E74732E246974656D7365';
wwv_flow_imp.g_varchar2_table(47) := '743D652E5F6974656D242E706172656E7428292C652E5F656C656D656E74732E246D6C73427574746F6E3D652E5F656C656D656E74732E246974656D7365742E66696E642822627574746F6E2E6A746C6974656D2D6D6F64616C2D6F70656E22297D2C5F';
wwv_flow_imp.g_varchar2_table(48) := '73796E634C616E67756167654D61703A66756E6374696F6E28297B76617220652C743D6E756C6C3B666F7228746869732E6C6F6728225F73796E634C616E67756167654D617022292C653D746869732E5F76616C7565732E646174614A534F4E2C746869';
wwv_flow_imp.g_varchar2_table(49) := '732E5F76616C7565732E7461674D61703D7B7D2C743D303B652E6C656E6774683E743B742B3D3129746869732E5F76616C7565732E7461674D61705B655B745D2E6C5D3D655B745D2E746C7D2C5F676574544C3A66756E6374696F6E2865297B72657475';
wwv_flow_imp.g_varchar2_table(50) := '726E20746869732E5F76616C7565732E7461674D61705B655D7D2C5F696E6974446174614A534F4E3A66756E6374696F6E2865297B76617220743D5B5D2C693D657C7C7B7D3B746869732E6C6F6728225F696E6974446174614A534F4E22292C74686973';
wwv_flow_imp.g_varchar2_table(51) := '2E656C6F67287B696E7075745F646174613A697D292C617065782E6A51756572792E6973456D7074794F626A6563742869293F28746869732E6C6F672822496E697469616C697A696E67207769746820656D7074792076616C756522292C746869732E5F';
wwv_flow_imp.g_varchar2_table(52) := '76616C7565732E6C616E6775616765732E666F72456163682866756E6374696F6E2865297B742E70757368287B6C3A652C746C3A22227D297D292C746869732E5F76616C7565732E646174614A534F4E3D742C746869732E5F76616C7565732E6E657752';
wwv_flow_imp.g_varchar2_table(53) := '65636F72643D2130293A28746869732E5F76616C7565732E646174614A534F4E3D692C746869732E5F76616C7565732E6E65775265636F72643D2131292C746869732E5F73796E634C616E67756167654D617028297D2C5F73796E634A534F4E64617461';
wwv_flow_imp.g_varchar2_table(54) := '3A66756E6374696F6E2865297B76617220743B69662828743D766F69642030213D3D653F652E646174612E7569773A74686973292E6C6F6728225F73796E634A534F4E6461746122292C742E5F76616C7565732E6E65775265636F726429666F72287661';
wwv_flow_imp.g_varchar2_table(55) := '7220693D742E5F76616C7565732E746F74616C4C616E6775616765732D313B693E3D303B692D2D29742E5F76616C7565732E646174614A534F4E5B695D2E746C3D742E5F6974656D242E76616C28293B656C736520742E5F76616C7565732E646174614A';
wwv_flow_imp.g_varchar2_table(56) := '534F4E5B742E5F76616C7565732E637572725F6C616E675F696E6465785D2E746C3D742E5F6974656D242E76616C28293B742E5F73796E634C616E67756167654D617028297D2C5F696E69744469616C6F67427574746F6E733A66756E6374696F6E2829';
wwv_flow_imp.g_varchar2_table(57) := '7B746869732E5F656C656D656E74732E2463616E63656C427574746F6E2E62696E642822636C69636B222C7B7569773A746869737D2C746869732E5F68616E646C6543616E63656C427574746F6E436C69636B292C746869732E5F656C656D656E74732E';
wwv_flow_imp.g_varchar2_table(58) := '2473617665427574746F6E2E62696E642822636C69636B222C7B7569773A746869737D2C746869732E5F68616E646C6553617665427574746F6E436C69636B297D2C5F68616E646C6543616E63656C427574746F6E436C69636B3A66756E6374696F6E28';
wwv_flow_imp.g_varchar2_table(59) := '65297B76617220743D652E646174612E7569773B742E5F76616C7565732E6E65775265636F72643D21312C742E5F656C656D656E74732E246469616C6F672E6469616C6F672822636C6F736522297D2C5F68616E646C6553617665427574746F6E436C69';
wwv_flow_imp.g_varchar2_table(60) := '636B3A66756E6374696F6E2865297B76617220742C693D652E646174612E7569773B692E5F656C656D656E74732E246469616C6F67436F6E74656E742E66696E6428222E6A746C6974656D2D76616C756522292E656163682866756E6374696F6E28652C';
wwv_flow_imp.g_varchar2_table(61) := '61297B692E5F76616C7565732E646174614A534F4E5B655D2E6C3D612E646174617365742E6C616E672C692E5F76616C7565732E646174614A534F4E5B655D2E746C3D612E76616C75652C692E5F76616C7565732E637572725F6C616E675F696E646578';
wwv_flow_imp.g_varchar2_table(62) := '3D3D3D65262628743D612E76616C7565297D292C692E5F73796E634C616E67756167654D617028292C692E5F76616C7565732E6E65775265636F72643D21312C692E5F6974656D242E76616C2874292C692E5F7369676E616C4368616E676528292C692E';
wwv_flow_imp.g_varchar2_table(63) := '5F656C656D656E74732E246469616C6F672E6469616C6F672822636C6F736522297D2C5F7369676E616C4368616E67653A66756E6374696F6E28297B617065782E6A517565727928746869732E5F6974656D245B305D292E747269676765722822636861';
wwv_flow_imp.g_varchar2_table(64) := '6E676522297D2C5F68616E646C654F70656E436C69636B3A66756E6374696F6E2865297B76617220743D652E646174612E7569773B742E6C6F6728225F68616E646C654F70656E436C69636B22292C742E5F73796E634A534F4E646174612865292C742E';
wwv_flow_imp.g_varchar2_table(65) := '5F73686F774469616C6F6728297D2C5F73686F774469616C6F673A66756E6374696F6E28297B76617220652C742C692C613D746869732C6E3D612E5F76616C7565732E637572725F6C616E675F696E6465783B612E6C6F6728225F73686F774469616C6F';
wwv_flow_imp.g_varchar2_table(66) := '6722292C21612E5F76616C7565732E636F6E74726F6C6C65724D6F64652626617065782E6A51756572792E6973456D7074794F626A65637428612E5F656C656D656E74732E2467726964297C7C28612E6C6F6728227765206469646E2774206765742061';
wwv_flow_imp.g_varchar2_table(67) := '20686F6C64206F662074686520677269642C206D617962652074727920616761696E22292C612E5F696E697447726964436F6E6669672829292C653D273C7461626C6520636C6173733D22742D5265706F72742D7265706F7274222073756D6D6172793D';
wwv_flow_imp.g_varchar2_table(68) := '22417661696C61626C65205472616E736C6174696F6E73223E5C6E203C74723E5C6E20203C746820636C6173733D22742D5265706F72742D636F6C48656164223E272B612E5F76616C7565732E6D657373616765732E6C616E67756167654C6162656C2B';
wwv_flow_imp.g_varchar2_table(69) := '273C2F74683E20203C746820636C6173733D22742D5265706F72742D636F6C4865616420752D744C223E272B612E5F76616C7565732E6D657373616765732E6C616E677561676556616C75652B223C2F74683E203C2F74723E5C6E222C242E6561636828';
wwv_flow_imp.g_varchar2_table(70) := '612E5F76616C7565732E6C616E6775616765732C66756E6374696F6E28742C69297B652B3D22203C7472222B286E3D3D743F2720636C6173733D2273656C656374656422273A2222292B273E5C6E20203C746420636C6173733D22742D5265706F72742D';
wwv_flow_imp.g_varchar2_table(71) := '63656C6C20742D466F726D2D696E707574436F6E7461696E657220752D7443223E272B617065782E7574696C2E65736361706548544D4C417474722869292B273C2F74643E20203C746420636C6173733D22742D5265706F72742D63656C6C20742D466F';
wwv_flow_imp.g_varchar2_table(72) := '726D2D696E707574436F6E7461696E657220752D744C223E272C2254455854223D3D3D612E6F7074696F6E732E6974656D547970653F652B3D27202020203C696E70757420747970653D22746578742220636C6173733D22746578745F6669656C642061';
wwv_flow_imp.g_varchar2_table(73) := '7065782D6974656D2D74657874206A746C6974656D2D76616C75652220646174612D6C616E673D22272B692B27222076616C75653D22272B617065782E7574696C2E65736361706548544D4C4174747228612E5F676574544C286929292B27222073697A';
wwv_flow_imp.g_varchar2_table(74) := '653D22272B612E5F76616C7565732E6669656C6453697A652B2722206D61786C656E6774683D22272B612E5F76616C7565732E6669656C644D61784C656E6774682B27223E3C2F74643E273A652B3D27202020203C746578746172656120636C6173733D';
wwv_flow_imp.g_varchar2_table(75) := '22746578746172656120617065782D6974656D2D7465787461726561206A746C6974656D2D76616C75652220646174612D6C616E673D22272B692B272220636F6C733D22272B612E5F76616C7565732E6669656C6453697A652B272220726F77733D2227';
wwv_flow_imp.g_varchar2_table(76) := '2B612E5F76616C7565732E6669656C64526F77732B2722206D61786C656E6774683D22272B612E5F76616C7565732E6669656C644D61784C656E6774682B27223E272B617065782E7574696C2E65736361706548544D4C4174747228612E5F676574544C';
wwv_flow_imp.g_varchar2_table(77) := '286929292B223C2F74657874617265613E222C652B3D22203C2F74723E5C6E227D292C652B3D223C2F7461626C653E5C6E222C693D273C64697620636C6173733D22272B612E5F76616C7565732E706F707570436C6173732B27223E3C64697620636C61';
wwv_flow_imp.g_varchar2_table(78) := '73733D226A746C6974656D2D636F6E7461696E65722075692D776964676574223E5C6E20203C64697620636C6173733D226A746C6974656D2D627574746F6E2D636F6E7461696E6572223E5C6E20202020203C627574746F6E20636C6173733D226A746C';
wwv_flow_imp.g_varchar2_table(79) := '6974656D2D63616E63656C2D627574746F6E20742D427574746F6E223E202020202020203C7370616E20636C6173733D22742D427574746F6E2D6C6162656C223E272B612E5F76616C7565732E6D657373616765732E63616E63656C427574746F6E2B27';
wwv_flow_imp.g_varchar2_table(80) := '3C2F7370616E3E20202020203C2F627574746F6E3E5C6E20202020203C627574746F6E20636C6173733D226A746C6974656D2D736176652D627574746F6E20742D427574746F6E20742D427574746F6E2D2D686F74223E202020202020203C7370616E20';
wwv_flow_imp.g_varchar2_table(81) := '636C6173733D22742D427574746F6E2D6C6162656C223E272B612E5F76616C7565732E6D657373616765732E6170706C794368616E6765732B273C2F7370616E3E202020202020203C7370616E20636C6173733D22742D49636F6E20742D49636F6E2D2D';
wwv_flow_imp.g_varchar2_table(82) := '72696768742066612066612D636865636B223E3C2F7370616E3E20202020203C2F627574746F6E3E5C6E20203C2F6469763E5C6E20203C64697620636C6173733D226A746C6974656D2D636F6E74656E74223E5C6E272B652B2220203C2F6469763E5C6E';
wwv_flow_imp.g_varchar2_table(83) := '3C2F6469763E3C2F6469763E5C6E222C612E5F656C656D656E74732E24626F64792E617070656E642869292C612E5F656C656D656E74732E246469616C6F673D612E5F746F70417065782E6A517565727928612E5F76616C7565732E706F70757053454C';
wwv_flow_imp.g_varchar2_table(84) := '292C743D77696E646F773D3D3D77696E646F772E746F703F7B6D793A226C656674222C61743A226C6566742063656E746572222C6F663A612E5F6974656D245B305D7D3A7B6D793A2263656E7465722063656E746572222C61743A2263656E7465722063';
wwv_flow_imp.g_varchar2_table(85) := '656E746572222C6F663A612E5F746F70417065782E6A517565727928222E75692D6469616C6F6722295B305D7D2C612E5F656C656D656E74732E246469616C6F672E6469616C6F67287B636C6F73654F6E4573636170653A21302C7469746C653A612E6F';
wwv_flow_imp.g_varchar2_table(86) := '7074696F6E732E6469616C6F675469746C652C6175746F526573697A653A21302C6D696E57696474683A3430302C6D696E4865696768743A3235302C77696474683A226175746F222C6865696768743A226175746F222C6D6F64616C3A21302C6469616C';
wwv_flow_imp.g_varchar2_table(87) := '6F67436C6173733A2275692D6469616C6F67222C706F736974696F6E3A742C6F70656E3A66756E6374696F6E28297B612E5F696E69744469616C6F67456C656D656E747328292C612E5F696E69744469616C6F67427574746F6E7328292C612E5F656C65';
wwv_flow_imp.g_varchar2_table(88) := '6D656E74732E246469616C6F67436F6E74656E742E66696E64282274722E73656C6563746564202E6A746C6974656D2D76616C756522292E747269676765722822666F63757322297D2C636C6F73653A66756E6374696F6E28297B612E5F656C656D656E';
wwv_flow_imp.g_varchar2_table(89) := '74732E246469616C6F672E72656D6F766528292C612E5F656C656D656E74732E24646F63756D656E742E66696E6428612E5F76616C7565732E706F70757053454C292E72656D6F766528292C612E5F7265736574466F63757328297D7D292E6F6E28226B';
wwv_flow_imp.g_varchar2_table(90) := '6579646F776E222C66756E6374696F6E2865297B652E6B6579436F64653D3D3D242E75692E6B6579436F64652E4553434150452626612E5F656C656D656E74732E246469616C6F672E6469616C6F672822636C6F736522292C652E73746F7050726F7061';
wwv_flow_imp.g_varchar2_table(91) := '676174696F6E28297D297D2C64697361626C653A66756E6374696F6E28297B21313D3D3D746869732E5F76616C7565732E64697361626C6564262628746869732E5F6974656D242E61747472282264697361626C6564222C2264697361626C656422292C';
wwv_flow_imp.g_varchar2_table(92) := '746869732E5F656C656D656E74732E246D6C73427574746F6E2E61747472282264697361626C6564222C2264697361626C656422292E756E62696E642822636C69636B222C746869732E5F68616E646C654F70656E436C69636B29292C746869732E5F76';
wwv_flow_imp.g_varchar2_table(93) := '616C7565732E64697361626C65643D21307D2C656E61626C653A66756E6374696F6E28297B21303D3D3D746869732E5F76616C7565732E64697361626C6564262628746869732E5F6974656D242E72656D6F766541747472282264697361626C65642229';
wwv_flow_imp.g_varchar2_table(94) := '2C746869732E5F656C656D656E74732E246D6C73427574746F6E2E72656D6F766541747472282264697361626C656422292E62696E642822636C69636B222C7B7569773A746869737D2C746869732E5F68616E646C654F70656E436C69636B292C746869';
wwv_flow_imp.g_varchar2_table(95) := '732E5F76616C7565732E64697361626C65643D2131297D7D293B';
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
prompt --application/plugin_settings
begin
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(4951238734330576)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(26016722970268848)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(4951371654330576)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_APEX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'show_on', 'FOCUS',
  'time_increment', '15')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(4951490333330577)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'background', 'default',
  'display_as', 'LIST',
  'map_preview', 'POPUP:ITEM',
  'match_mode', 'RELAX_HOUSE_NUMBER')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(4952182763330577)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(4951993073330577)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(4952377215330577)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(477510725604001773)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SELECT_LIST',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(493249915196659483)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'PLUGIN_JMR.MLS.JTLITEM'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'return ''["en","fr","es"]'';',
  'attribute_02', wwv_flow_string.join(wwv_flow_t_varchar2(
    '{',
    '   "applyChanges": "Ok",',
    '   "cancelButton": "Cancel",',
    '   "languageLabel": "Language",',
    '   "languageValue": "Translation",',
    '   "noDataFound": "No specified languages.",',
    '   "valueValidationError": "#LABEL# contains an invalid value."',
    '}')))).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(4951852519330577)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'match_mode', 'RELAX_HOUSE_NUMBER')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(477510471803001771)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'Y')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(26016932289268849)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'LEGACY')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(4951594100330577)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(4951724817330577)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(4951678121330577)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
);
end;
/
prompt --application/shared_components/navigation/lists/desktop_navigation_bar
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(477553067079001952)
,p_name=>'Desktop Navigation Bar'
,p_static_id=>'desktop-navigation-bar'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(478398516658837708)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'English'
,p_static_id=>'english'
,p_list_item_link_target=>'f?p=&APP_ID.:500:&SESSION.:BRANCH_TO_PAGE_ACCEPT:&DEBUG.::P500_LAST_PAGE,G_LANG:&APP_PAGE_ID.,en'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_list_item_disp_condition=>'G_LANG'
,p_list_item_disp_condition2=>'en'
,p_parent_list_item_id=>wwv_flow_imp.id(478398234415833961)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(478408396421847172)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>unistr('Espa\00F1ol')
,p_static_id=>unistr('espa\00F1ol')
,p_list_item_link_target=>'f?p=&APP_ID.:500:&SESSION.:BRANCH_TO_PAGE_ACCEPT:&DEBUG.::P500_LAST_PAGE,G_LANG:&APP_PAGE_ID.,es'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_list_item_disp_condition=>'G_LANG'
,p_list_item_disp_condition2=>'es'
,p_parent_list_item_id=>wwv_flow_imp.id(478398234415833961)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(478399216212844723)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>unistr('Fran\00E7ais')
,p_static_id=>unistr('fran\00E7ais')
,p_list_item_link_target=>'f?p=&APP_ID.:500:&SESSION.:BRANCH_TO_PAGE_ACCEPT:&DEBUG.::P500_LAST_PAGE,G_LANG:&APP_PAGE_ID.,fr'
,p_list_item_disp_cond_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
,p_list_item_disp_condition=>'G_LANG'
,p_list_item_disp_condition2=>'fr'
,p_parent_list_item_id=>wwv_flow_imp.id(478398234415833961)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(478398234415833961)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Languages (&G_LANG.)'
,p_static_id=>'languages-g-lang'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.'
,p_list_item_icon=>'fa-globe'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(477553318585001984)
,p_list_item_display_sequence=>99
,p_list_item_link_text=>'Log Out'
,p_static_id=>'log-out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/navigation/lists/desktop_navigation_menu
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(477510798740001773)
,p_name=>'Desktop Navigation Menu'
,p_static_id=>'desktop-navigation-menu'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(477554537409002047)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_static_id=>'home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1,4,6'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(469893782410352905)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'JTL with CLOB'
,p_static_id=>'jtl-with-clob'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.'
,p_parent_list_item_id=>wwv_flow_imp.id(477554537409002047)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4,5'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(15523171656145760)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'JTL with IG [New!]'
,p_static_id=>'jtl-with-ig-new'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.'
,p_parent_list_item_id=>wwv_flow_imp.id(477554537409002047)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'6'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(477555068121002055)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Projects'
,p_static_id=>'projects'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.'
,p_parent_list_item_id=>wwv_flow_imp.id(477554537409002047)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2,3'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(4975111111111111)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Form Region (JSON)'
,p_static_id=>'form-region-json'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.'
,p_parent_list_item_id=>wwv_flow_imp.id(477554537409002047)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'7'
);
end;
/
prompt --application/shared_components/navigation/listentry
begin
null;
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_processes/apex_nitro
begin
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(478348526768636783)
,p_process_sequence=>-999
,p_process_point=>'BEFORE_HEADER'
,p_process_name=>'APEX Nitro'
,p_static_id=>'apex-nitro'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- apex_application.g_flow_images := owa_util.get_cgi_env(''APEX-Nitro'');',
':G_APEX_NITRO_IMAGES := owa_util.get_cgi_env(''APEX-Nitro'');'))
,p_process_clob_language=>'PLSQL'
,p_process_when=>'owa_util.get_cgi_env(''APEX-Nitro'') is not null'
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(478348209134632531)
);
end;
/
prompt --application/shared_components/logic/application_items/g_apex_nitro_images
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(478368402027741006)
,p_name=>'G_APEX_NITRO_IMAGES'
,p_protection_level=>'I'
,p_escape_on_http_output=>'N'
);
end;
/
prompt --application/shared_components/logic/application_items/g_lang
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(478298948504001280)
,p_name=>'G_LANG'
,p_scope=>'GLOBAL'
,p_protection_level=>'N'
,p_escape_on_http_output=>'N'
);
end;
/
prompt --application/shared_components/logic/application_settings
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/pages/page_groups
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(477554533962002039)
,p_name=>' Breadcrumb'
,p_static_id=>'breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(477554887766002050)
,p_short_name=>'Home'
,p_static_id=>'home'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.'
,p_page_id=>1
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(469898799934352972)
,p_parent_id=>wwv_flow_imp.id(477554887766002050)
,p_short_name=>'JTL with CLOB'
,p_static_id=>'jtl-with-clob'
,p_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.'
,p_page_id=>4
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(15524266391145780)
,p_parent_id=>wwv_flow_imp.id(477554887766002050)
,p_short_name=>'JTL with IG'
,p_static_id=>'jtl-with-ig'
,p_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.'
,p_page_id=>6
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(469899957229352984)
,p_parent_id=>wwv_flow_imp.id(469898799934352972)
,p_short_name=>'Maintain JTL with CLOB'
,p_static_id=>'maintain-jtl-with-clob'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.'
,p_page_id=>5
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(477559392769002212)
,p_parent_id=>wwv_flow_imp.id(477556365935002089)
,p_option_sequence=>30
,p_short_name=>'Maintain Project'
,p_static_id=>'maintain-project'
,p_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.'
,p_page_id=>3
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(477556365935002089)
,p_parent_id=>wwv_flow_imp.id(477554887766002050)
,p_option_sequence=>20
,p_short_name=>'Projects'
,p_static_id=>'projects'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.'
,p_page_id=>2
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(4975111111111112)
,p_parent_id=>wwv_flow_imp.id(477554887766002050)
,p_option_sequence=>50
,p_short_name=>'Form Region JTL'
,p_static_id=>'form-region-jtl'
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.'
,p_page_id=>7
);
end;
/
prompt --application/shared_components/navigation/breadcrumbentry
begin
null;
end;
/
prompt --application/shared_components/user_interface/shortcuts/delete_confirm_msg
begin
wwv_flow_imp_shared.create_shortcut(
 p_id=>wwv_flow_imp.id(477557359740002167)
,p_shortcut_name=>'DELETE_CONFIRM_MSG'
,p_shortcut_type=>'TEXT_ESCAPE_JS'
,p_shortcut=>'Would you like to perform this delete action?'
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(477549066081001919)
,p_theme_id=>42
,p_static_id=>'universal-theme'
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_version_identifier=>'26.1'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_is_locked=>false
,p_current_theme_style_id=>3294906487728305352
,p_default_page_template=>4073832297226169690
,p_default_dialog_template=>2101883943284197310
,p_error_template=>2102634289808461002
,p_printer_friendly_template=>4073832297226169690
,p_login_template=>2102634289808461002
,p_default_button_template=>4073839297780169708
,p_default_region_template=>4073835273271169698
,p_default_chart_template=>4073835273271169698
,p_default_form_template=>4073835273271169698
,p_default_reportr_template=>4073835273271169698
,p_default_wizard_template=>4073835273271169698
,p_default_menur_template=>2532939663579242476
,p_default_listr_template=>4073835273271169698
,p_default_irr_template=>2102002977963900996
,p_default_report_template=>2540130677583398057
,p_default_label_template=>2320077351817916916
,p_default_menu_template=>4073839682315169711
,p_default_list_template=>4073837480889169704
,p_default_top_nav_list_temp=>2528231041045349458
,p_default_side_nav_list_temp=>2469215554099805162
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>2127905476394690047
,p_default_dialogr_template=>4502917002193490937
,p_default_option_label=>2320077351817916916
,p_default_header_template=>2042159785845301134
,p_default_footer_template=>2042159785845301134
,p_default_required_label=>2528236951996823187
,p_default_navbar_list_template=>2849019392706229583
,p_file_prefix=>nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/26.1/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
,p_reference_id=>wwv_imp_util.get_subscription_id(4073840274158169736,2000,'universal-theme',8842.261)
,p_version_scn_master=>'SH256:WOPVC8vP1TPWUxczh2dJ4mCZcNGSTzA1cn8DjR2oQjY'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(477548774718001905)
,p_theme_id=>42
,p_name=>'Vista'
,p_static_id=>'vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_read_only=>true
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(477541503768001864)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_static_id=>'color-accents'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(477533811628001845)
,p_theme_id=>42
,p_name=>'COLOR_ACCENTS'
,p_static_id=>'color-accents'
,p_display_name=>'Color Accents'
,p_display_sequence=>50
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
null;
end;
/
prompt --application/shared_components/globalization/language
begin
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(4971071998329927)
,p_translation_flow_id=>106
,p_translation_flow_language_cd=>'fr'
,p_direction_right_to_left=>'N'
);
wwv_flow_imp_shared.create_language_map(
 p_id=>wwv_flow_imp.id(4971140652329927)
,p_translation_flow_id=>107
,p_translation_flow_language_cd=>'es'
,p_direction_right_to_left=>'N'
);
end;
/
prompt --application/shared_components/logic/build_options
begin
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(478348209134632531)
,p_build_option_name=>'DEV_ONLY'
,p_static_id=>'dev-only'
,p_build_option_status=>'INCLUDE'
,p_default_on_export=>'INCLUDE'
);
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/security/authentications/apex
begin
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(477553353070001991)
,p_name=>'APEX'
,p_static_id=>'apex'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'procedure post_auth',
'is',
'begin',
'  :G_LANG := nvl(apex_util.get_session_lang, ''en'');',
'end;',
''))
,p_invalid_session_type=>'LOGIN'
,p_post_auth_process=>'post_auth'
,p_cookie_name=>'INSUM'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Home'
,p_step_title=>'Home'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_inline_css=>'.fork-me {position: absolute; top:0; right:0}'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(480509993484021016)
,p_plug_name=>'About the JTL Item Plugin'
,p_static_id=>'about-the-jtl-item-plugin'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This demo uses tables with columns that store translations in JSON format.<br>',
'<br>',
'These JSON columns use a plugin that handles the JSON structure automatically. The user only sees the language selected.<br>',
'',
'Use the <span class="t-Icon fa fa-globe"></span> button next to the item to edit all languages. The button is configurable so that only users that need to edit all languages have access to it.<br>',
'',
'<br>',
'<hr>',
'The JSON format structure for a translation column is of this form:<br>',
'<pre>',
'[ {"l": "us", "tl": "Project Analysis"}',
', {"l": "fr", "tl": "Analyse de projet"}',
', {"l": "es", "tl": "Analisis de projecto"}]',
'</pre>',
'',
'Where `l` is the language code and `tl` is the translation.<br>',
'<br>',
'<br>',
'<b>Repo:</b> <a href="https://github.com/rimblas/jtlitem" target="_blank">github.com/rimblas/jtlitem</a><br>',
'',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(482831074090390342)
,p_plug_name=>'APEX.PAGE_ITEM_IS_REQUIRED'
,p_static_id=>'apex-page-item-is-required'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'htp.p(''wwv_flow_lang.system_message:'' || wwv_flow_lang.system_message(''APEX.PAGE_ITEM_IS_REQUIRED''));',
'htp.br;',
'htp.p(''apex_lang.message:'' || apex_lang.message(''APEX.PAGE_ITEM_IS_REQUIRED''));',
'',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This is the message that the plugin will use when a value is required.<br>',
'<br>'))
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(477555022157002055)
,p_plug_name=>'Breadcrumbs'
,p_static_id=>'breadcrumbs'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(477554533962002039)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(477579779704009727)
,p_plug_name=>'Environment'
,p_static_id=>'environment'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'htp.p(''<p>'' || ''BROWSER_LANGUAGE:'' || :BROWSER_LANGUAGE || ''</p>'');',
'htp.p(''<p>'' || ''apex_util.get_session_lang:'' || apex_util.get_session_lang || ''</p>'');',
''))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15318204641311867)
,p_plug_name=>'Fork Me'
,p_static_id=>'fork-me'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'<a href="https://github.com/rimblas/jtlitem"><img width="149" height="149" src="https://github.blog/wp-content/uploads/2008/12/forkme_right_darkblue_121621.png?resize=149%2C149" class="fork-me attachment-full size-full" alt="Fork me on GitHub" data-r'
||'ecalc-dims="1"></a>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_imp_page.create_page(
 p_id=>2
,p_name=>'Projects'
,p_step_title=>'Projects'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(477556486278002089)
,p_plug_name=>'Breadcrumbs'
,p_static_id=>'breadcrumbs'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(477554533962002039)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(477555366476002070)
,p_plug_name=>'Projects'
,p_static_id=>'projects'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'"ID",',
'"NAME_JTL",',
'"LANG",',
'"NAME",',
'"DESCRIPTION",',
'"ALIAS",',
'"ACTIVE_IND",',
'"CREATED_BY",',
'"CREATED_ON",',
'"UPDATED_BY",',
'"UPDATED_ON"',
' from px_projects2_vl',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(477555451098002072)
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::P3_ID:#ID#'
,p_detail_link_text=>'&EDIT_BUTTON.'
,p_internal_uid=>7877516194085257
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477555880053002086)
,p_db_column_name=>'ACTIVE_IND'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Active?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_help_text=>'Indicates if the record is active or inactive.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477555811897002086)
,p_db_column_name=>'ALIAS'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Alias'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477555935774002086)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477556111770002087)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Created On'
,p_column_type=>'DATE'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477579892582009728)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>38
,p_column_identifier=>'M'
,p_column_label=>'Description'
,p_column_html_expression=>'<pre>#DESCRIPTION#</pre>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477555574065002081)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477579011039009719)
,p_db_column_name=>'LANG'
,p_display_order=>28
,p_column_identifier=>'L'
,p_column_label=>'Lang'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477578843022009718)
,p_db_column_name=>'NAME'
,p_display_order=>18
,p_column_identifier=>'K'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477555722160002086)
,p_db_column_name=>'NAME_JTL'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Name Jtl'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477556144191002087)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477556302662002087)
,p_db_column_name=>'UPDATED_ON'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Updated On'
,p_column_type=>'DATE'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_help_text=>'No help available for this page item.'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(477578115265006543)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'79002'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NAME:DESCRIPTION:LANG:ALIAS:ACTIVE_IND'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(477559308134002210)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(477555366476002070)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>2084305881903810008
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:3'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_row=>'Y'
);
end;
/
prompt --application/pages/page_00003
begin
wwv_flow_imp_page.create_page(
 p_id=>3
,p_name=>'Maintain Project'
,p_step_title=>'Maintain Project'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';',
'',
''))
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(477579056697009720)
,p_plug_name=>'Audit'
,p_static_id=>'audit'
,p_parent_plug_id=>wwv_flow_imp.id(477556904090002165)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2665811232373458102
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P3_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(477559526432002212)
,p_plug_name=>'Breadcrumbs'
,p_static_id=>'breadcrumbs'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(477554533962002039)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(477556904090002165)
,p_plug_name=>'Maintain Project'
,p_static_id=>'maintain-project'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(477556971621002165)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(477556904090002165)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(477557253454002165)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(477556904090002165)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P3_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(477557110163002165)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(477556904090002165)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P3_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(477580117842009730)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(477556904090002165)
,p_button_name=>'DISABLE'
,p_static_id=>'disable'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Disable Name'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(477580384264009733)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(477556904090002165)
,p_button_name=>'ENABLE'
,p_static_id=>'enable'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Enable Name'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(477557170420002165)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(477556904090002165)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>2084305881903810008
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'CREATE'
,p_button_condition=>'P3_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_grid_new_row=>'Y'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(4972204328329948)
,p_branch_action=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(477558082046002201)
,p_name=>'P3_ACTIVE_IND'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(477556904090002165)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Active?'
,p_source=>'ACTIVE_IND'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>2320077351817916916
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indicates if the record is active or inactive.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(477557843859002201)
,p_name=>'P3_ALIAS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(477556904090002165)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Alias'
,p_source=>'ALIAS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>32
,p_field_template=>2320077351817916916
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(477558262699002202)
,p_name=>'P3_CREATED_BY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(477579056697009720)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2320077351817916916
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(477558503941002202)
,p_name=>'P3_CREATED_ON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(477579056697009720)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Created On'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_source=>'CREATED_ON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2320077351817916916
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(477579953111009729)
,p_name=>'P3_DESCRIPTION_JTL'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(477556904090002165)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'DESCRIPTION_JTL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_JMR.MLS.JTLITEM'
,p_cSize=>70
,p_cMaxlength=>400
,p_cHeight=>2
,p_field_template=>2528236951996823187
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This item is using a multi-language plugin. All translations for a column are stored along with the column in JSON format.<br>',
'The structure is of this form:<br>',
'<pre>',
'[ {"l": "us", "tl": "Project Analysis"}',
', {"l": "fr", "tl": "Analyse de projet"}',
', {"l": "es", "tl": "Analisis de projecto"}]',
'</pre>',
'',
'Where `l` is the language code and `tl` is the translation.<br>',
'Use the <span class="t-Icon fa fa-globe"></span> button to edit all languages. The button is configurable so that only users that need to edit all languages have access to it.'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_02', 'return true;',
  'attribute_03', 'TEXTAREA')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(477557625311002170)
,p_name=>'P3_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(477556904090002165)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(477557655752002171)
,p_name=>'P3_NAME_JTL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(477556904090002165)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Name'
,p_source=>'NAME_JTL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_JMR.MLS.JTLITEM'
,p_cSize=>40
,p_cMaxlength=>60
,p_tag_css_classes=>'is-active'
,p_field_template=>2528236951996823187
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This item is using a multi-language plugin. All translations for a column are stored along with the column in JSON format.<br>',
'The structure is of this form:<br>',
'<pre>',
'[ {"l": "us", "tl": "Project Analysis"}',
', {"l": "fr", "tl": "Analyse de projet"}',
', {"l": "es", "tl": "Analisis de projecto"}]',
'</pre>',
'',
'Where `l` is the language code and `tl` is the translation.<br>',
'Use the <span class="t-Icon fa fa-globe"></span> button to edit all languages. The button is configurable so that only users that need to edit all languages have access to it.'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_02', 'return true;',
  'attribute_03', 'TEXT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(477558674631002202)
,p_name=>'P3_UPDATED_BY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(477579056697009720)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Updated By'
,p_source=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2320077351817916916
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(477558890741002202)
,p_name=>'P3_UPDATED_ON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(477579056697009720)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Updated On'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_source=>'UPDATED_ON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2320077351817916916
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(482828839095390320)
,p_validation_name=>'P3_NAME_JTL is not null'
,p_static_id=>'p3-name-jtl-is-not-null'
,p_validation_sequence=>10
,p_validation=>'tk_jtl_plugin.get_tl_value(:P3_NAME_JTL) is not null'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'The name is required'
,p_associated_item=>wwv_flow_imp.id(477557655752002171)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(477580230448009731)
,p_name=>'Disable Button'
,p_static_id=>'disable-button'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(477580117842009730)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(477580262387009732)
,p_event_id=>wwv_flow_imp.id(477580230448009731)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_NAME_JTL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(477580477392009734)
,p_name=>'Enable Name'
,p_static_id=>'enable-name'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(477580384264009733)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(477580551902009735)
,p_event_id=>wwv_flow_imp.id(477580477392009734)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P3_NAME_JTL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(19401455715107680)
,p_name=>'Record Change'
,p_static_id=>'record-change'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P3_NAME_JTL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19401544323107681)
,p_event_id=>wwv_flow_imp.id(19401455715107680)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'console.log("Changed!", $v(this.triggeringElement));')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(477559039814002205)
,p_process_sequence=>1
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from PX_PROJECTS2'
,p_static_id=>'fetch-row-from-px-projects'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'primary_key_column', 'ID',
  'primary_key_item', 'P3_ID',
  'table_name', 'PX_PROJECTS2')).to_clob
,p_internal_uid=>477559039814002205
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(477559211765002205)
,p_process_sequence=>1
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of PX_PROJECTS2'
,p_static_id=>'process-row-of-px-projects'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'primary_key_column', 'ID',
  'primary_key_item', 'P3_ID',
  'supported_operations', 'I:U:D',
  'table_name', 'PX_PROJECTS2')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
,p_internal_uid=>477559211765002205
);
end;
/
prompt --application/pages/page_00004
begin
wwv_flow_imp_page.create_page(
 p_id=>4
,p_name=>'JTL with Blob'
,p_step_title=>'JTL with CLOB'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(469898989065352977)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(477554533962002039)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(469894737434352945)
,p_plug_name=>'JTL with CLOB'
,p_static_id=>'jtl-with-clob'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id',
'     , name',
'     , decode(sign(length(description)-150)',
'       , null, null',
'       , -1, description',
unistr('       , substr(description,1,150) ||''\2026'') description'),
'     , active_ind',
'     , created_by',
'     , created_on',
'     , updated_by',
'     , updated_on',
'from px_jtl_with_clob_vl',
'  ',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(469895094066352947)
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::P5_ID:#ID#'
,p_detail_link_text=>'&EDIT_BUTTON.'
,p_internal_uid=>443878911454084626
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(469896414654352969)
,p_db_column_name=>'ACTIVE_IND'
,p_display_order=>31
,p_column_identifier=>'D'
,p_column_label=>'Active?'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_help_text=>'Indicates is the record is enabled.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(469896867919352969)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>41
,p_column_identifier=>'E'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(469897251083352970)
,p_db_column_name=>'CREATED_ON'
,p_display_order=>51
,p_column_identifier=>'F'
,p_column_label=>'Created On'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(469108762792099331)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>21
,p_column_identifier=>'J'
,p_column_label=>'Description'
,p_column_html_expression=>'<pre>#DESCRIPTION#</pre>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(469895271825352956)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(469108675788099330)
,p_db_column_name=>'NAME'
,p_display_order=>11
,p_column_identifier=>'I'
,p_column_label=>'Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(469897661450352971)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>61
,p_column_identifier=>'G'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(469898055083352971)
,p_db_column_name=>'UPDATED_ON'
,p_display_order=>71
,p_column_identifier=>'H'
,p_column_label=>'Updated On'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(469910857251374642)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'4438947'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'NAME:DESCRIPTION:ACTIVE_IND:CREATED_BY:CREATED_ON:UPDATED_BY:UPDATED_ON'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(469898460233352972)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(469894737434352945)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>2084305881903810008
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_row=>'Y'
);
end;
/
prompt --application/pages/page_00005
begin
wwv_flow_imp_page.create_page(
 p_id=>5
,p_name=>'Maintain JTL with Clob'
,p_step_title=>'Maintain JTL with Clob'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(469912233788380710)
,p_plug_name=>'Audit'
,p_static_id=>'audit'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2665811232373458102
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P5_ID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(469899624420352983)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(477554533962002039)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(469888137460352621)
,p_plug_name=>'Maintain JTL with Clob'
,p_static_id=>'maintain-jtl-with-clob'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(469888839811352629)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(469888137460352621)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(469888528356352628)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(469888137460352621)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>2084305881903810008
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P5_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-check'
,p_grid_new_row=>'Y'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(469888714844352628)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(469888137460352621)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_execute_validations=>'N'
,p_button_condition=>'P5_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(469888634652352628)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(469888137460352621)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>2084305881903810008
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CHANGE'
,p_button_condition=>'P5_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-check'
,p_grid_new_row=>'Y'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(4973028462329983)
,p_branch_action=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(469911547293379151)
,p_name=>'P5_ACTIVE_IND'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(469888137460352621)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Y'
,p_prompt=>'Active?'
,p_source=>'ACTIVE_IND'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>2320077351817916916
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Indicates if the record is active or inactive.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(469912553419380725)
,p_name=>'P5_CREATED_BY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(469912233788380710)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Created By'
,p_source=>'CREATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2320077351817916916
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(469913430514380727)
,p_name=>'P5_CREATED_ON'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(469912233788380710)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Created On'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_source=>'CREATED_ON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2320077351817916916
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(469891501818352882)
,p_name=>'P5_DESCRIPTION_JTL'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(469888137460352621)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'DESCRIPTION_JTL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_JMR.MLS.JTLITEM'
,p_cSize=>60
,p_cMaxlength=>3000
,p_cHeight=>2
,p_field_template=>2528236951996823187
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_02', 'return true;',
  'attribute_03', 'TEXTAREA')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(469890789901352835)
,p_name=>'P5_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(469888137460352621)
,p_use_cache_before_default=>'NO'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(469891112541352874)
,p_name=>'P5_NAME_JTL'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(469888137460352621)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Name'
,p_source=>'NAME_JTL'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_JMR.MLS.JTLITEM'
,p_cSize=>40
,p_cMaxlength=>50
,p_cHeight=>1
,p_field_template=>2528236951996823187
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_02', 'return true;',
  'attribute_03', 'TEXT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(469914322591380729)
,p_name=>'P5_UPDATED_BY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(469912233788380710)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Updated By'
,p_source=>'UPDATED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2320077351817916916
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(469915257931380730)
,p_name=>'P5_UPDATED_ON'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(469912233788380710)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Updated On'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_source=>'UPDATED_ON'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2320077351817916916
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'No help available for this page item.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(469892238256352888)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from PX_JTL_WITH_CLOB'
,p_static_id=>'fetch-row-from-px-jtl-with-clob'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'primary_key_column', 'ID',
  'primary_key_item', 'P5_ID',
  'table_name', 'PX_JTL_WITH_CLOB')).to_clob
,p_internal_uid=>469892238256352888
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(469892627094352891)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of PX_JTL_WITH_CLOB'
,p_static_id=>'process-row-of-px-jtl-with-clob'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'primary_key_column', 'ID',
  'primary_key_item', 'P5_ID',
  'supported_operations', 'I:U:D',
  'table_name', 'PX_JTL_WITH_CLOB')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Action Processed.'
,p_internal_uid=>469892627094352891
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(469893070644352893)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'reset page'
,p_static_id=>'reset-page'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(469888714844352628)
,p_internal_uid=>469893070644352893
);
end;
/
prompt --application/pages/page_00006
begin
wwv_flow_imp_page.create_page(
 p_id=>6
,p_name=>'JTL with IG'
,p_step_title=>'JTL with IG'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15523929155145777)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(477554533962002039)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15524481719145783)
,p_plug_name=>'JTL with IG'
,p_static_id=>'jtl-with-ig'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ID,',
'       NAME_JTL,',
'       ALIAS,',
'       ACTIVE_IND',
'  from PX_PROJECTS'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15529132769145829)
,p_name=>'ACTIVE_IND'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACTIVE_IND'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_YES_NO'
,p_heading=>'Active?'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'Y'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15528553776145827)
,p_name=>'ALIAS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ALIAS'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Alias'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>32
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15526226206145811)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15525636079145809)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15526793646145820)
,p_name=>'ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(15527355405145823)
,p_name=>'NAME_JTL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NAME_JTL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'PLUGIN_JMR.MLS.JTLITEM'
,p_heading=>'Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_02', 'return true;',
  'attribute_03', 'TEXT')).to_clob
,p_is_required=>true
,p_max_length=>500
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
,p_escape_on_http_output=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(15524993171145787)
,p_internal_uid=>10573964164815430
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>true
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET:SAVE'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function (config)',
'    {',
'      config.defaultGridViewOptions = ',
'      {',
'        autoAddRow: false',
'      }',
'',
'return config;',
'}'))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(15525362730145797)
,p_interactive_grid_id=>wwv_flow_imp.id(15524993171145787)
,p_static_id=>'primary'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(4973283620329983)
,p_report_id=>wwv_flow_imp.id(15525362730145797)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(4973363290329984)
,p_view_id=>wwv_flow_imp.id(4973283620329983)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(15526226206145811)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(4973446304329984)
,p_view_id=>wwv_flow_imp.id(4973283620329983)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(15526793646145820)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(4973536444329984)
,p_view_id=>wwv_flow_imp.id(4973283620329983)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(15527355405145823)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>180
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(4973653204329984)
,p_view_id=>wwv_flow_imp.id(4973283620329983)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(15528553776145827)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>179
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(4973754013329984)
,p_view_id=>wwv_flow_imp.id(4973283620329983)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(15529132769145829)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(15529810028145832)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(15524481719145783)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>' - Save Interactive Grid Data'
,p_static_id=>'save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>15529810028145832
);
end;
/
prompt --application/pages/page_00007
begin
wwv_flow_imp_page.create_page(
 p_id=>7
,p_name=>'Form Region JTL'
,p_step_title=>'Form Region JTL'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'Form Region (19.1+) on PX_PROJECTS2 JSON-typed columns. Classic Automatic Row Fetch on page 3 returns NULL for the same columns; this page is the working path.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(4975111111111115)
,p_plug_name=>'Breadcrumbs'
,p_static_id=>'breadcrumbs'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2532939663579242476
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(477554533962002039)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4073839682315169711
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(4973937214329984)
,p_plug_name=>'Form Region JTL'
,p_static_id=>'form'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'PX_PROJECTS2'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(4974548236329985)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(4973937214329984)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CREATE'
,p_button_condition=>'P7_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_grid_new_row=>'Y'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(4974676125329985)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(4973937214329984)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'CREATE'
,p_button_condition=>'P7_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(4975111111111113)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(4973937214329984)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(4975111111111114)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(4973937214329984)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_button_condition=>'P7_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_grid_new_row=>'Y'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4974405314329985)
,p_name=>'P7_ACTIVE_IND'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(4973937214329984)
,p_item_source_plug_id=>wwv_flow_imp.id(4973937214329984)
,p_item_default=>'Y'
,p_prompt=>'Active?'
,p_source=>'ACTIVE_IND'
,p_display_as=>'NATIVE_YES_NO'
,p_field_template=>2320077351817916916
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4974331787329985)
,p_name=>'P7_ALIAS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(4973937214329984)
,p_item_source_plug_id=>wwv_flow_imp.id(4973937214329984)
,p_prompt=>'Alias'
,p_source=>'ALIAS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>32
,p_field_template=>2320077351817916916
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4974266591329984)
,p_name=>'P7_DESCRIPTION_JTL'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(4973937214329984)
,p_item_source_plug_id=>wwv_flow_imp.id(4973937214329984)
,p_prompt=>'Description'
,p_source=>'DESCRIPTION_JTL'
,p_display_as=>'PLUGIN_JMR.MLS.JTLITEM'
,p_cSize=>70
,p_cMaxlength=>1000
,p_cHeight=>2
,p_field_template=>2528236951996823187
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_02', 'return true;',
  'attribute_03', 'TEXTAREA')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4974028043329984)
,p_name=>'P7_ID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(4973937214329984)
,p_item_source_plug_id=>wwv_flow_imp.id(4973937214329984)
,p_source=>'ID'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4974148225329984)
,p_name=>'P7_NAME_JTL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(4973937214329984)
,p_item_source_plug_id=>wwv_flow_imp.id(4973937214329984)
,p_prompt=>'Name'
,p_source=>'NAME_JTL'
,p_display_as=>'PLUGIN_JMR.MLS.JTLITEM'
,p_cSize=>40
,p_cMaxlength=>60
,p_field_template=>2528236951996823187
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_02', 'return true;',
  'attribute_03', 'TEXT')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(4974755273329985)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(4973937214329984)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize Form Region JTL'
,p_static_id=>'initialize-form'
,p_internal_uid=>4974755273329985
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(4974893335329985)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(4973937214329984)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process Form Region JTL'
,p_static_id=>'process-form'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Form region action processed.'
,p_internal_uid=>4974893335329985
);
end;
/
prompt --application/pages/page_00101
begin
wwv_flow_imp_page.create_page(
 p_id=>101
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_step_title=>'Translation Demo - Log In'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(".a-LinksList-item").addClass("t-Button").addClass("t-Button--pill");',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-LinksList--lang {text-align: center;}',
'a.a-LinksList-link {position: relative; z-index: 2;}',
'.t-Login-logo.fa.appIcon {',
'font-size: 50px;',
'}',
'.appIcon {',
'-webkit-border-radius: 4px;',
'-moz-border-radius: 4px;',
'border-radius: 4px;',
'-webkit-box-shadow: 0 0 1px rgba(0,0,0,0.75) inset;',
'-moz-box-shadow: 0 0 1px rgba(0,0,0,0.75) inset;',
'box-shadow: 0 0 1px rgba(0,0,0,0.75) inset;',
'}',
''))
,p_step_template=>2102634289808461002
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_page_component_map=>'12'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(477553684178002015)
,p_plug_name=>'JTL Item Plugin Demo'
,p_static_id=>'jtl-item-plugin-demo'
,p_icon_css_classes=>'appIcon fa-globe'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2675634334296186762
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_footer=>'Credentials: <b>demo/demo</b>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15318125265311766)
,p_plug_name=>'Language List'
,p_static_id=>'language-list'
,p_parent_plug_id=>wwv_flow_imp.id(477553684178002015)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>'apex_lang.emit_language_selector_list;'
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(477554006269002033)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(477553684178002015)
,p_button_name=>'LOGIN'
,p_static_id=>'login'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Log In'
,p_button_position=>'NEXT'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(477553918961002032)
,p_name=>'P101_PASSWORD'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(477553684178002015)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>2042262243893469891
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(477553828124002026)
,p_name=>'P101_USERNAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(477553684178002015)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>2042262243893469891
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(477554407209002038)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_static_id=>'clear-page-s-cache'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>477554407209002038
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(477554328081002038)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_static_id=>'get-username-cookie'
,p_process_sql_clob=>':P101_USERNAME := apex_authentication.get_login_username_cookie;'
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>477554328081002038
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(477554108350002035)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_static_id=>'login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P101_USERNAME,',
'    p_password => :P101_PASSWORD );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>477554108350002035
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(477554162393002038)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_static_id=>'set-username-cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P101_USERNAME) );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>477554162393002038
);
end;
/
prompt --application/pages/page_00500
begin
wwv_flow_imp_page.create_page(
 p_id=>500
,p_name=>'Switch Language'
,p_step_title=>'Switch Language'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(477579531673009724)
,p_plug_name=>'Items'
,p_static_id=>'items'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(4975189466329986)
,p_branch_name=>'Return to page'
,p_branch_action=>'f?p=&APP_ID.:&P500_LAST_PAGE.:&SESSION.::&DEBUG.:RP&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(477579602453009725)
,p_name=>'P500_LAST_PAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(477579531673009724)
,p_prompt=>'Last page'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2320077351817916916
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(477579363477009723)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Switch Language'
,p_static_id=>'switch-language'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.set_session_lang(:G_LANG);',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>477579363477009723
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := 'drop view px_projects_json_vl;'||wwv_flow.LF||'drop table px_projects_json;'||wwv_flow.LF||'drop view px_projects2_vl;'||wwv_flow.LF||'drop table px_projects2;'||wwv_flow.LF||'drop view px_projects_vl;'||wwv_flow.LF||'drop table px_projects;'||wwv_flow.LF||'drop view px_jtl_with_clob_vl;'||wwv_flow.LF||'drop ta';
wwv_flow_imp.g_varchar2_table(2) := 'ble px_jtl_with_clob;'||wwv_flow.LF||'';
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(479968059421043544)
,p_get_version_sql_query=>'SELECT OBJECT_NAME FROM SYS.USER_OBJECTS WHERE OBJECT_NAME = ''PX_PROJECTS2'''
,p_deinstall_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_required_free_kb=>100
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE TABLE:CREATE TRIGGER:CREATE VIEW'
);
end;
/
prompt --application/deployment/install/install_all_objects
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := 'create table px_projects ('||wwv_flow.LF||'    id            number        generated by default on null as identity (start with 1) primary key not null'||wwv_flow.LF||'  , name_jtl      json          not null'||wwv_flow.LF||'  , alias         varch';
wwv_flow_imp.g_varchar2_table(2) := 'ar2(32)'||wwv_flow.LF||'  , active_ind    varchar2(1)   not null'||wwv_flow.LF||'  , created_by    varchar2(60) default'||wwv_flow.LF||'                    coalesce('||wwv_flow.LF||'                        sys_context(''APEX$SESSION'',''app_user'')'||wwv_flow.LF||'                   ';
wwv_flow_imp.g_varchar2_table(3) := '   , regexp_substr(sys_context(''userenv'',''client_identifier''),''^[^:]*'')'||wwv_flow.LF||'                      , sys_context(''userenv'',''session_user'')'||wwv_flow.LF||'                    )'||wwv_flow.LF||'                    not null'||wwv_flow.LF||'  , created_on ';
wwv_flow_imp.g_varchar2_table(4) := '   date         default sysdate not null'||wwv_flow.LF||'  , updated_by    varchar2(60)'||wwv_flow.LF||'  , updated_on    date'||wwv_flow.LF||'  , constraint px_projects_ck_active'||wwv_flow.LF||'      check (active_ind in (''Y'', ''N''))'||wwv_flow.LF||')'||wwv_flow.LF||'enable primary key using in';
wwv_flow_imp.g_varchar2_table(5) := 'dex'||wwv_flow.LF||'/'||wwv_flow.LF||'comment on column px_projects.name_jtl is ''JSON data with the language as keys. Syntax: [{"l": "us", "tl": "Project Analysis"}]'';'||wwv_flow.LF||'create or replace trigger px_projects_u'||wwv_flow.LF||'before update'||wwv_flow.LF||'on px_proj';
wwv_flow_imp.g_varchar2_table(6) := 'ects'||wwv_flow.LF||'referencing old as old new as new'||wwv_flow.LF||'for each row'||wwv_flow.LF||'begin'||wwv_flow.LF||'  :new.updated_on := sysdate;'||wwv_flow.LF||'  :new.updated_by := coalesce('||wwv_flow.LF||'                         sys_context(''APEX$SESSION'',''app_user'')'||wwv_flow.LF||'                 ';
wwv_flow_imp.g_varchar2_table(7) := '      , regexp_substr(sys_context(''userenv'',''client_identifier''),''^[^:]*'')'||wwv_flow.LF||'                       , sys_context(''userenv'',''session_user'')'||wwv_flow.LF||'                     );'||wwv_flow.LF||'end;'||wwv_flow.LF||'/'||wwv_flow.LF||'insert into PX_PROJECTS (NAME_J';
wwv_flow_imp.g_varchar2_table(8) := unistr('TL,ALIAS,ACTIVE_IND) values (''[{"l":"en","tl":"Gardening"},{"l":"fr","tl":"Gardening - Fran\00E7ais"},{"l":"es","tl":"Sembrar"}]'',''Garden'',''Y'');')||wwv_flow.LF||'insert into PX_PROJECTS (NAME_JTL,ALIAS,ACTIVE_IND) values ';
wwv_flow_imp.g_varchar2_table(9) := unistr('(''[{"l":"en","tl":"Painting"},{"l":"fr","tl":"Painting - Fran\00E7ais"},{"l":"es","tl":"Pintar"}]'',''Paint 2'',''Y'');')||wwv_flow.LF||''||wwv_flow.LF||'create or replace view px_projects_vl'||wwv_flow.LF||'as'||wwv_flow.LF||'select t.id'||wwv_flow.LF||'     , t.name_jtl'||wwv_flow.LF||'     , jd.lang'||wwv_flow.LF||'  ';
wwv_flow_imp.g_varchar2_table(10) := '   , jd.tl name'||wwv_flow.LF||'     , t.alias'||wwv_flow.LF||'     , t.active_ind'||wwv_flow.LF||'     , t.created_by'||wwv_flow.LF||'     , t.created_on'||wwv_flow.LF||'     , t.updated_by'||wwv_flow.LF||'     , t.updated_on'||wwv_flow.LF||'  from px_projects t'||wwv_flow.LF||'     , json_table(t.name_jtl, ''$[*]'''||wwv_flow.LF||'        col';
wwv_flow_imp.g_varchar2_table(11) := 'umns ('||wwv_flow.LF||'             lang varchar2(10)      path ''$.l'''||wwv_flow.LF||'           , tl   varchar2(60 char) path ''$.tl'''||wwv_flow.LF||'       )) jd'||wwv_flow.LF||' where jd.lang = (select nvl(apex_util.get_session_lang,''en'') from dual)'||wwv_flow.LF||'/'||wwv_flow.LF||''||wwv_flow.LF||'create ta';
wwv_flow_imp.g_varchar2_table(12) := 'ble px_projects2 ('||wwv_flow.LF||'    id            number        generated by default on null as identity (start with 1) primary key not null'||wwv_flow.LF||'  , name_jtl      json          not null'||wwv_flow.LF||'  , description_jtl json       ';
wwv_flow_imp.g_varchar2_table(13) := ' not null'||wwv_flow.LF||'  , alias         varchar2(32)'||wwv_flow.LF||'  , active_ind    varchar2(1)   not null'||wwv_flow.LF||'  , created_by    varchar2(60) default'||wwv_flow.LF||'                    coalesce('||wwv_flow.LF||'                        sys_context(''APEX$SESSION';
wwv_flow_imp.g_varchar2_table(14) := ''',''app_user'')'||wwv_flow.LF||'                      , regexp_substr(sys_context(''userenv'',''client_identifier''),''^[^:]*'')'||wwv_flow.LF||'                      , sys_context(''userenv'',''session_user'')'||wwv_flow.LF||'                    )'||wwv_flow.LF||'           ';
wwv_flow_imp.g_varchar2_table(15) := '         not null'||wwv_flow.LF||'  , created_on    date         default sysdate not null'||wwv_flow.LF||'  , updated_by    varchar2(60)'||wwv_flow.LF||'  , updated_on    date'||wwv_flow.LF||'  , constraint px_projects2_ck_active check (active_ind in (''Y'', ''N''))'||wwv_flow.LF||')';
wwv_flow_imp.g_varchar2_table(16) := ''||wwv_flow.LF||'enable primary key using index'||wwv_flow.LF||'/'||wwv_flow.LF||'comment on column px_projects2.name_jtl is ''JSON data with the language as keys. Syntax: [{"l": "us", "tl": "Project Analysis"}]'';'||wwv_flow.LF||'comment on column px_projects2.desc';
wwv_flow_imp.g_varchar2_table(17) := 'ription_jtl is ''JSON data with the language as keys. Syntax: [{"l": "us", "tl": "Project Analysis"}]'';'||wwv_flow.LF||'create or replace trigger px_projects2_u'||wwv_flow.LF||'before update'||wwv_flow.LF||'on px_projects2'||wwv_flow.LF||'referencing old as old new';
wwv_flow_imp.g_varchar2_table(18) := ' as new'||wwv_flow.LF||'for each row'||wwv_flow.LF||'begin'||wwv_flow.LF||'  :new.updated_on := sysdate;'||wwv_flow.LF||'  :new.updated_by := coalesce('||wwv_flow.LF||'                         sys_context(''APEX$SESSION'',''app_user'')'||wwv_flow.LF||'                       , regexp_substr(sys_conte';
wwv_flow_imp.g_varchar2_table(19) := 'xt(''userenv'',''client_identifier''),''^[^:]*'')'||wwv_flow.LF||'                       , sys_context(''userenv'',''session_user'')'||wwv_flow.LF||'                     );'||wwv_flow.LF||'end;'||wwv_flow.LF||'/'||wwv_flow.LF||'insert into PX_PROJECTS2 (NAME_JTL,DESCRIPTION_JTL,ALIAS,ACTIV';
wwv_flow_imp.g_varchar2_table(20) := unistr('E_IND) values (''[{"l":"en","tl":"Name 1 - English"},{"l":"fr","tl":"Nom 1 - Fran\00E7ais"},{"l":"es","tl":"Nombre 1 - Espa\00F1ol"}]'',''[{"l":"en","tl":"Desc 1 - English"},{"l":"fr","tl":"Desc 1 - Fran\00E7ais"},{');
wwv_flow_imp.g_varchar2_table(21) := unistr('"l":"es","tl":"Desc 1 - Espa\00F1ol"}]'',''Nom 1'',''Y'');')||wwv_flow.LF||unistr('insert into PX_PROJECTS2 (NAME_JTL,DESCRIPTION_JTL,ALIAS,ACTIVE_IND) values (''[{"l":"en","tl":"Nom 2- English"},{"l":"fr","tl":"Nom 2 - Fran\00E7ais"},{"l');
wwv_flow_imp.g_varchar2_table(22) := unistr('":"es","tl":"Nom 2 - Espa\00F1ol"}]'',''[{"l":"en","tl":"Desc 2 - English"},{"l":"fr","tl":"Desc 2 - Fran\00E7ais"},{"l":"es","tl":"Desc 2 - Espa\00F1ol"}]'',''Nom 2'',''Y'');')||wwv_flow.LF||''||wwv_flow.LF||'create or replace view px_projects2_vl'||wwv_flow.LF||'as'||wwv_flow.LF||'';
wwv_flow_imp.g_varchar2_table(23) := 'with n_tl as ('||wwv_flow.LF||'  select /*+ no_merge */ p.id'||wwv_flow.LF||'       , t.lang'||wwv_flow.LF||'       , t.tl'||wwv_flow.LF||'    from px_projects2 p'||wwv_flow.LF||'       , json_table(p.name_jtl, ''$[*]'''||wwv_flow.LF||'          columns ('||wwv_flow.LF||'                   lang varchar2(10) path ';
wwv_flow_imp.g_varchar2_table(24) := '''$.l'''||wwv_flow.LF||'                 , tl   varchar2(50 char) path ''$.tl'''||wwv_flow.LF||'                  )'||wwv_flow.LF||'        ) t'||wwv_flow.LF||'),'||wwv_flow.LF||'d_tl as ('||wwv_flow.LF||'  select /*+ no_merge */ p.id'||wwv_flow.LF||'       , t.lang'||wwv_flow.LF||'       , t.tl'||wwv_flow.LF||'    from px_projects2 p'||wwv_flow.LF||'       , js';
wwv_flow_imp.g_varchar2_table(25) := 'on_table(p.description_jtl, ''$[*]'''||wwv_flow.LF||'          columns ('||wwv_flow.LF||'                   lang varchar2(10) path ''$.l'''||wwv_flow.LF||'                 , tl   varchar2(1000 char) path ''$.tl'''||wwv_flow.LF||'                  )'||wwv_flow.LF||'        ) t'||wwv_flow.LF||')'||wwv_flow.LF||'select ';
wwv_flow_imp.g_varchar2_table(26) := 'p.id'||wwv_flow.LF||'     , p.name_jtl'||wwv_flow.LF||'     , p.description_jtl'||wwv_flow.LF||'     , n_tl.lang'||wwv_flow.LF||'     , n_tl.tl   name'||wwv_flow.LF||'     , d_tl.tl   description'||wwv_flow.LF||'     , p.alias'||wwv_flow.LF||'     , p.active_ind'||wwv_flow.LF||'     , p.created_by'||wwv_flow.LF||'     , p.created_on'||wwv_flow.LF||'     , p.';
wwv_flow_imp.g_varchar2_table(27) := 'updated_by'||wwv_flow.LF||'     , p.updated_on'||wwv_flow.LF||'  from px_projects2 p'||wwv_flow.LF||'     , n_tl'||wwv_flow.LF||'     , d_tl'||wwv_flow.LF||' where p.id = n_tl.id'||wwv_flow.LF||'   and p.id = d_tl.id'||wwv_flow.LF||'   and n_tl.lang = d_tl.lang'||wwv_flow.LF||'   and n_tl.lang = (select nvl(apex_util.get_sessi';
wwv_flow_imp.g_varchar2_table(28) := 'on_lang,''en'') from dual)'||wwv_flow.LF||'/'||wwv_flow.LF||''||wwv_flow.LF||'create table px_jtl_with_clob ('||wwv_flow.LF||'    id            number        generated by default on null as identity (start with 1) primary key not null'||wwv_flow.LF||'  , name_jtl      varchar2(500)';
wwv_flow_imp.g_varchar2_table(29) := '   not null constraint px_jtl_with_clob_name_tl_ck CHECK (name_jtl is json(strict))'||wwv_flow.LF||'  , description_jtl clob not null constraint px_jtl_with_clob_desc_tl_ck CHECK (description_jtl is json(strict))'||wwv_flow.LF||'  ,';
wwv_flow_imp.g_varchar2_table(30) := ' alias         varchar2(32)'||wwv_flow.LF||'  , active_ind    varchar2(1)   not null'||wwv_flow.LF||'  , created_by    varchar2(60) default'||wwv_flow.LF||'                    coalesce('||wwv_flow.LF||'                        sys_context(''APEX$SESSION'',''app_user'')';
wwv_flow_imp.g_varchar2_table(31) := ''||wwv_flow.LF||'                      , regexp_substr(sys_context(''userenv'',''client_identifier''),''^[^:]*'')'||wwv_flow.LF||'                      , sys_context(''userenv'',''session_user'')'||wwv_flow.LF||'                    )'||wwv_flow.LF||'                    not ';
wwv_flow_imp.g_varchar2_table(32) := 'null'||wwv_flow.LF||'  , created_on    date         default sysdate not null'||wwv_flow.LF||'  , updated_by    varchar2(60)'||wwv_flow.LF||'  , updated_on    date'||wwv_flow.LF||'  , constraint px_jtl_with_clob_ck_active'||wwv_flow.LF||'      check (active_ind in (''Y'', ''N''))'||wwv_flow.LF||')'||wwv_flow.LF||'en';
wwv_flow_imp.g_varchar2_table(33) := 'able primary key using index'||wwv_flow.LF||'/'||wwv_flow.LF||'comment on table px_jtl_with_clob is ''Demo table to test clobs'';'||wwv_flow.LF||'comment on column px_jtl_with_clob.name_jtl is ''JSON data with the language as keys. Syntax: [{"l": "us"';
wwv_flow_imp.g_varchar2_table(34) := ', "tl": "Project Analysis"}]'';'||wwv_flow.LF||'comment on column px_jtl_with_clob.description_jtl is ''JSON data with the language as keys. Syntax: [{"l": "us", "tl": "Project Analysis"}]'';'||wwv_flow.LF||'create or replace trigger p';
wwv_flow_imp.g_varchar2_table(35) := 'x_jtl_with_clob_u'||wwv_flow.LF||'before update'||wwv_flow.LF||'on px_jtl_with_clob'||wwv_flow.LF||'referencing old as old new as new'||wwv_flow.LF||'for each row'||wwv_flow.LF||'begin'||wwv_flow.LF||'  :new.updated_on := sysdate;'||wwv_flow.LF||'  :new.updated_by := coalesce('||wwv_flow.LF||'                         sys_conte';
wwv_flow_imp.g_varchar2_table(36) := 'xt(''APEX$SESSION'',''app_user'')'||wwv_flow.LF||'                       , regexp_substr(sys_context(''userenv'',''client_identifier''),''^[^:]*'')'||wwv_flow.LF||'                       , sys_context(''userenv'',''session_user'')'||wwv_flow.LF||'               ';
wwv_flow_imp.g_varchar2_table(37) := '      );'||wwv_flow.LF||'end;'||wwv_flow.LF||'/'||wwv_flow.LF||'create or replace view px_jtl_with_clob_vl'||wwv_flow.LF||'as'||wwv_flow.LF||'with n_tl as ('||wwv_flow.LF||'  select /*+ no_merge */ p.id'||wwv_flow.LF||'       , t.lang'||wwv_flow.LF||'       , t.tl'||wwv_flow.LF||'    from px_jtl_with_clob p'||wwv_flow.LF||'       , json_table(p.name_jtl, ''$[';
wwv_flow_imp.g_varchar2_table(38) := '*]'''||wwv_flow.LF||'          columns ('||wwv_flow.LF||'                   lang varchar2(10) path ''$.l'''||wwv_flow.LF||'                 , tl   varchar2(50 char) path ''$.tl'''||wwv_flow.LF||'                  )'||wwv_flow.LF||'        ) t'||wwv_flow.LF||'),'||wwv_flow.LF||'d_tl as ('||wwv_flow.LF||'  select /*+ no_merge */ p.id';
wwv_flow_imp.g_varchar2_table(39) := ''||wwv_flow.LF||'       , t.lang'||wwv_flow.LF||'       , t.tl'||wwv_flow.LF||'    from px_jtl_with_clob p'||wwv_flow.LF||'       , json_table(p.description_jtl, ''$[*]'''||wwv_flow.LF||'          columns ('||wwv_flow.LF||'                   lang varchar2(10) path ''$.l'''||wwv_flow.LF||'                 , tl   var';
wwv_flow_imp.g_varchar2_table(40) := 'char2(4000) path ''$.tl'''||wwv_flow.LF||'                  )'||wwv_flow.LF||'        ) t'||wwv_flow.LF||')'||wwv_flow.LF||'select p.id'||wwv_flow.LF||'     , p.name_jtl'||wwv_flow.LF||'     , p.description_jtl'||wwv_flow.LF||'     , n_tl.lang'||wwv_flow.LF||'     , n_tl.tl   name'||wwv_flow.LF||'     , d_tl.tl   description'||wwv_flow.LF||'     , p.alias'||wwv_flow.LF||'    ';
wwv_flow_imp.g_varchar2_table(41) := ' , p.active_ind'||wwv_flow.LF||'     , p.created_by'||wwv_flow.LF||'     , p.created_on'||wwv_flow.LF||'     , p.updated_by'||wwv_flow.LF||'     , p.updated_on'||wwv_flow.LF||'  from px_jtl_with_clob p'||wwv_flow.LF||'     , n_tl'||wwv_flow.LF||'     , d_tl'||wwv_flow.LF||' where p.id = n_tl.id'||wwv_flow.LF||'   and p.id = d_tl.id'||wwv_flow.LF||'   and n_t';
wwv_flow_imp.g_varchar2_table(42) := 'l.lang = d_tl.lang'||wwv_flow.LF||'   and n_tl.lang = (select nvl(apex_util.get_session_lang,''en'') from dual)'||wwv_flow.LF||'/'||wwv_flow.LF||''||wwv_flow.LF||'create table px_projects_json ('||wwv_flow.LF||'    id            number generated by default on null as identity prima';
wwv_flow_imp.g_varchar2_table(43) := 'ry key not null'||wwv_flow.LF||'  , name_jtl      json'||wwv_flow.LF||'  , alias         varchar2(32)'||wwv_flow.LF||'  , active_ind    varchar2(1) default ''Y'' not null'||wwv_flow.LF||'  , constraint px_projects_json_ck_active check (active_ind in (''Y'',''N''))'||wwv_flow.LF||')'||wwv_flow.LF||'/'||wwv_flow.LF||'c';
wwv_flow_imp.g_varchar2_table(44) := 'reate or replace view px_projects_json_vl'||wwv_flow.LF||'as'||wwv_flow.LF||'select t.id'||wwv_flow.LF||'     , t.name_jtl'||wwv_flow.LF||'     , jd.lang'||wwv_flow.LF||'     , jd.tl name'||wwv_flow.LF||'     , t.alias'||wwv_flow.LF||'     , t.active_ind'||wwv_flow.LF||'  from px_projects_json t'||wwv_flow.LF||'     , json_table(t.name_jtl, ''';
wwv_flow_imp.g_varchar2_table(45) := '$[*]'''||wwv_flow.LF||'        columns ('||wwv_flow.LF||'             lang varchar2(10)      path ''$.l'''||wwv_flow.LF||'           , tl   varchar2(60 char) path ''$.tl'''||wwv_flow.LF||'       )) jd'||wwv_flow.LF||' where jd.lang = (select nvl(apex_util.get_session_lang,''en'') from d';
wwv_flow_imp.g_varchar2_table(46) := 'ual)'||wwv_flow.LF||'/'||wwv_flow.LF||'insert into px_projects_json (name_jtl, alias, active_ind) values (''[{"l":"en","tl":"JSON Form Seed"},{"l":"fr","tl":"Forme JSON"},{"l":"es","tl":"Formulario JSON"}]'',''json1'',''Y'');'||wwv_flow.LF||'';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(479978174256050489)
,p_install_id=>wwv_flow_imp.id(479968059421043544)
,p_name=>'All Objects'
,p_sequence=>10
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/deployment/install/upgrade_new_clob_table
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := 'alter table px_projects2 modify description_jtl varchar2(4000);'||wwv_flow.LF||
''||wwv_flow.LF||
'create table px_jtl_with_clob ('||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(2) := ' id            number        generated by default on null as identity (start with 1) primary key not';
wwv_flow_imp.g_varchar2_table(3) := ' null'||wwv_flow.LF||
'  , name_jtl      varchar2(500)   not null constraint px_jtl_with_clob_name_tl_ck CHECK (name_';
wwv_flow_imp.g_varchar2_table(4) := 'jtl is json(strict))'||wwv_flow.LF||
'  , description_jtl clob not null constraint px_jtl_with_clob_desc_tl_ck CHECK ';
wwv_flow_imp.g_varchar2_table(5) := '(description_jtl is json(strict))'||wwv_flow.LF||
'  , alias         varchar2(32)'||wwv_flow.LF||
'  , active_ind    varchar2(1)   not';
wwv_flow_imp.g_varchar2_table(6) := ' null'||wwv_flow.LF||
'  , created_by    varchar2(60) default '||wwv_flow.LF||
'                    coalesce('||wwv_flow.LF||
'                        ';
wwv_flow_imp.g_varchar2_table(7) := 'sys_context(''APEX$SESSION'',''app_user'')'||wwv_flow.LF||
'                      , regexp_substr(sys_context(''userenv'',''';
wwv_flow_imp.g_varchar2_table(8) := 'client_identifier''),''^[^:]*'')'||wwv_flow.LF||
'                      , sys_context(''userenv'',''session_user'')'||wwv_flow.LF||
'        ';
wwv_flow_imp.g_varchar2_table(9) := '            )'||wwv_flow.LF||
'                    not null'||wwv_flow.LF||
'  , created_on    date         default sysdate not null'||wwv_flow.LF||
' ';
wwv_flow_imp.g_varchar2_table(10) := ' , updated_by    varchar2(60)'||wwv_flow.LF||
'  , updated_on    date'||wwv_flow.LF||
'  , constraint px_jtl_with_clob_ck_active'||wwv_flow.LF||
'     ';
wwv_flow_imp.g_varchar2_table(11) := ' check (active_ind in (''Y'', ''N''))'||wwv_flow.LF||
')'||wwv_flow.LF||
'enable primary key using index'||wwv_flow.LF||
'/'||wwv_flow.LF||
''||wwv_flow.LF||
'comment on table px_jtl_with_c';
wwv_flow_imp.g_varchar2_table(12) := 'lob is ''Demo table to test clobs'';'||wwv_flow.LF||
''||wwv_flow.LF||
'comment on column px_jtl_with_clob.name_jtl is ''JSON data with t';
wwv_flow_imp.g_varchar2_table(13) := 'he language as keys. Syntax: [{"l": "us", "tl": "Project Analysis"}]'';'||wwv_flow.LF||
'comment on column px_jtl_with';
wwv_flow_imp.g_varchar2_table(14) := '_clob.description_jtl is ''JSON data with the language as keys. Syntax: [{"l": "us", "tl": "Project A';
wwv_flow_imp.g_varchar2_table(15) := 'nalysis"}]'';'||wwv_flow.LF||
'comment on column px_jtl_with_clob.active_ind is ''Is the record enabled Y/N?'';'||wwv_flow.LF||
'comment ';
wwv_flow_imp.g_varchar2_table(16) := 'on column px_jtl_with_clob.created_by is ''User that created this record'';'||wwv_flow.LF||
'comment on column px_jtl_w';
wwv_flow_imp.g_varchar2_table(17) := 'ith_clob.created_on is ''Date the record was first created'';'||wwv_flow.LF||
'comment on column px_jtl_with_clob.updat';
wwv_flow_imp.g_varchar2_table(18) := 'ed_by is ''User that last modified this record'';'||wwv_flow.LF||
'comment on column px_jtl_with_clob.updated_on is ''Da';
wwv_flow_imp.g_varchar2_table(19) := 'te the record was last modified'';'||wwv_flow.LF||
''||wwv_flow.LF||
''||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'--  DDL';
wwv_flow_imp.g_varchar2_table(20) := ' for Trigger px_jtl_with_clob_u'||wwv_flow.LF||
'--------------------------------------------------------'||wwv_flow.LF||
'create or r';
wwv_flow_imp.g_varchar2_table(21) := 'eplace trigger px_jtl_with_clob_u'||wwv_flow.LF||
'before update'||wwv_flow.LF||
'on px_jtl_with_clob'||wwv_flow.LF||
'referencing old as old new as ne';
wwv_flow_imp.g_varchar2_table(22) := 'w'||wwv_flow.LF||
'for each row'||wwv_flow.LF||
'begin'||wwv_flow.LF||
'  :new.updated_on := sysdate;'||wwv_flow.LF||
'  :new.updated_by := coalesce('||wwv_flow.LF||
'                  ';
wwv_flow_imp.g_varchar2_table(23) := '       sys_context(''APEX$SESSION'',''app_user'')'||wwv_flow.LF||
'                       , regexp_substr(sys_context(''us';
wwv_flow_imp.g_varchar2_table(24) := 'erenv'',''client_identifier''),''^[^:]*'')'||wwv_flow.LF||
'                       , sys_context(''userenv'',''session_user'')';
wwv_flow_imp.g_varchar2_table(25) := ''||wwv_flow.LF||
'                     );'||wwv_flow.LF||
'end;'||wwv_flow.LF||
'/'||wwv_flow.LF||
'create or replace view px_jtl_with_clob_vl'||wwv_flow.LF||
'as'||wwv_flow.LF||
'with n_tl as ('||wwv_flow.LF||
'  selec';
wwv_flow_imp.g_varchar2_table(26) := 't /*+ no_merge */ p.id'||wwv_flow.LF||
'       , t.lang'||wwv_flow.LF||
'       , t.tl'||wwv_flow.LF||
'    from px_jtl_with_clob p'||wwv_flow.LF||
'       , xmltable(''';
wwv_flow_imp.g_varchar2_table(27) := '/json/row'' passing apex_json.to_xmltype(p.name_jtl)'||wwv_flow.LF||
'          columns'||wwv_flow.LF||
'               lang  varchar2(';
wwv_flow_imp.g_varchar2_table(28) := '10 char) path ''l'''||wwv_flow.LF||
'             , tl    varchar2(50 char) path ''tl'''||wwv_flow.LF||
'        ) t'||wwv_flow.LF||
'),'||wwv_flow.LF||
'd_tl as ('||wwv_flow.LF||
'  select';
wwv_flow_imp.g_varchar2_table(29) := ' /*+ no_merge */ p.id'||wwv_flow.LF||
'       , t.lang'||wwv_flow.LF||
'       , t.tl'||wwv_flow.LF||
'    from px_jtl_with_clob p'||wwv_flow.LF||
'       , json_table(';
wwv_flow_imp.g_varchar2_table(30) := 'p.description_jtl, ''$[*]'''||wwv_flow.LF||
'          columns ('||wwv_flow.LF||
'                   lang varchar2(10) path ''$.l'''||wwv_flow.LF||
'      ';
wwv_flow_imp.g_varchar2_table(31) := '           , tl   varchar2(4000) path ''$.tl'''||wwv_flow.LF||
'                  )'||wwv_flow.LF||
'        ) t'||wwv_flow.LF||
')'||wwv_flow.LF||
'select p.id'||wwv_flow.LF||
'     , p.';
wwv_flow_imp.g_varchar2_table(32) := 'name_jtl'||wwv_flow.LF||
'     , p.description_jtl'||wwv_flow.LF||
'     , n_tl.lang'||wwv_flow.LF||
'     , n_tl.tl   name'||wwv_flow.LF||
'     , d_tl.tl   descriptio';
wwv_flow_imp.g_varchar2_table(33) := 'n'||wwv_flow.LF||
'     , p.alias'||wwv_flow.LF||
'     , p.active_ind'||wwv_flow.LF||
'     , p.created_by'||wwv_flow.LF||
'     , p.created_on'||wwv_flow.LF||
'     , p.updated_by'||wwv_flow.LF||
'   ';
wwv_flow_imp.g_varchar2_table(34) := '  , p.updated_on'||wwv_flow.LF||
'  from px_jtl_with_clob p'||wwv_flow.LF||
'     , n_tl'||wwv_flow.LF||
'     , d_tl'||wwv_flow.LF||
' where p.id = n_tl.id'||wwv_flow.LF||
'   and p.id';
wwv_flow_imp.g_varchar2_table(35) := ' = d_tl.id'||wwv_flow.LF||
'   and n_tl.lang = d_tl.lang'||wwv_flow.LF||
'   and n_tl.lang = (select nvl(apex_util.get_session_lang,''e';
wwv_flow_imp.g_varchar2_table(36) := 'n'') from dual)'||wwv_flow.LF||
'/'||wwv_flow.LF||
'';
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(470078153365936455)
,p_install_id=>wwv_flow_imp.id(479968059421043544)
,p_name=>'New CLOB table'
,p_sequence=>10
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
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
