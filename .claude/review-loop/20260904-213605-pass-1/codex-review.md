The API-v3 migration leaves the documented package-backed callback path incompatible with the plugin definition. The CSS distribution also retains stale source-map content.

Full review comments:

- [P1] Migrate package callbacks before enabling API v3 — /Users/gemmawood/gitrepo/jtlitem/item_type_plugin_jmr_mls_jtlitem.sql:514-514
  When an installation follows the documented recommendation to use `tk_jtl_plugin.render` and `tk_jtl_plugin.validate`, this API-v3 switch populates the new `attributes` collections instead of the legacy `attribute_XX` fields. The unchanged `plsql/tk_jtl_plugin.plb` still reads those legacy fields (for example lines 165 and 178–186), causing package-backed rendering and validation to receive null configuration. Update the packaged callbacks in the same release or retain API v2 until they are migrated.

- [P3] Regenerate the CSS source maps — /Users/gemmawood/gitrepo/jtlitem/www/dist/css/jtl_item.css:1-1
  After these rule deletions, `www/dist/css/jtl_item.css.map` still embeds the previous 737-byte source containing `button.jtlitem-modal-open` and the removed floating-label rules; the newly added APEXlang copy contains the same stale map. When source maps are enabled, developer tools therefore display incorrect source and mappings for this stylesheet.
