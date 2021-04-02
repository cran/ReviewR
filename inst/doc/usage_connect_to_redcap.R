## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----echo=FALSE, message=FALSE------------------------------------------------
library(dplyr)
library(magrittr)
library(gt)
ReviewR::redcap_widget_map %>% 
  mutate(class = case_when(redcap_field_type %in% c('text', 'notes') ~ 'Text Field',
                           redcap_field_type %in% c('dropdown', 'radio') ~ 'Single Answer',
                           redcap_field_type %in% c('checkbox') ~ 'Multiple Answer',
                           redcap_field_type %in% c('yesno', 'truefalse') ~ 'Logical',
                           TRUE ~ 'Other'),
         redcap_field_validation = case_when(redcap_field_type == "text" & is.na(redcap_field_validation) ~ "None",
                                             redcap_field_validation == "date_mdy" ~ "Date (M-D-Y)",
                                             redcap_field_validation == "integer" ~ "Integer",
                                             TRUE ~ redcap_field_validation),
         redcap_field_type = case_when(redcap_field_type == "text" ~ "Text Box (Short Text, Number, Data/Time, ...)",
                                       redcap_field_type == "notes" ~ "Notes Box (Paragraph Text)",
                                       redcap_field_type == "dropdown" ~ "Multiple Choice - Drop-down List (Single Answer)",
                                       redcap_field_type == "radio" ~ "Multiple Choice - Radio Buttons (Single Answer)",
                                       redcap_field_type == "checkbox" ~ "Checkboxes (Multiple Answers)",
                                       redcap_field_type == "truefalse" ~ "True - False",
                                       redcap_field_type == "yesno" ~ "Yes - No",
                                       TRUE ~ redcap_field_type)) %>% 
  group_by(redcap_field_type) %>% 
  summarise(redcap_field_validation = paste(redcap_field_validation, collapse = "; ")) %>% 
  gt() %>%
  cols_label(redcap_field_type = md('**REDCap Field Type**'), 
             redcap_field_validation = md('**Supported Validation Options**'))

## ----figure_1, echo=FALSE, fig.cap="*Add REDCap Connection information.*", fig.align='center'----
knitr::include_graphics('redcap_connect.png')

## ----figure_2, echo=FALSE, fig.cap="*Select from available reviewers.*", fig.align='center'----
knitr::include_graphics('redcap_select_reviewer.png')

## ----figure_3, echo=FALSE, fig.cap="*Add a new reviewer.*", fig.align='center'----
knitr::include_graphics('redcap_add_reviewer.png')

## ----figure_4, echo=FALSE, fig.cap="*Review selections when configured*", fig.align='center'----
knitr::include_graphics('redcap_configure_success.png')

