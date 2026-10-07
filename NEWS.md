# naomi.resources 0.0.9

* Fix SRB prevalence log odds ratios (`prevalence_lor.csv`) being identical across countries. Previously the generating script fitted every country on the pooled multi-country survey data, so all countries except ZAF shared one set of LORs; now each country is fitted on its own survey data, falling back to pooled data where a country has no usable rows, and for CAF, BEN and ZWE, and ZAF and GMB men, where per-country fits are unstable.
* Include ages 45-49 in `lor_30to49`. Previously a typo in the age-group filter (`Y045_49` instead of `Y045_049`) dropped 45-49 year olds from the 30-49 regression. `lor_15to29` is unchanged.
* `sexpaid12m_id` LORs are `NA` for countries without enough survey data to estimate them. These are not used by `naomi.utils` SHIPP calculations, which take KP LORs for that group instead.

# naomi.resources 0.0.8

* Update excel workbook with new incidence categories
* Update Country model tab with 2025 survey update
* Add in SRB survey year on Country Model tab
* Update SAE sexual risk behaviour model using subnational boundaries for 2025 UNAIDS HIV estimates (CY2024Q4) + inclusion of all available SRB surveys
* Year for SRB results now pulled in from "Model inputs" tab in the SHIPP wb template. Year set to year of most recent survey with SRB data and to 2018 for countries where most recent SRB survey is older that 2018.
* Add function to extract SRB survey year from SHIPP wb template.

# naomi.resources 0.0.7

* Update with new excel workbook, KP subpopulation now in hidden tab.
* Update to 2024 Goals estimates

# naomi.resources 0.0.6

* Update with new excel workbook, KP subpopulation now in hidden tab.
* Update to 2023 Goals estimates

# naomi.resources 0.0.5

* Update with SAE sexual risk behaviour model using subnational boundaries for 2024 UNAIDS HIV estimates process + inclusion of THISS survey. 


# naomi.resources 0.0.4

* Add GOALS-RSM estimates for KP PSEs and prevalence.
* Rename agyw tool -> SHIPP (Sub-national HIV estimates In Priority Populations) tool.
