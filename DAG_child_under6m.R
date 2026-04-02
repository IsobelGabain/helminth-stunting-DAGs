# DAG: Helminth infection -> Childhood stunting (children <6 months DAG)
# Method: ESC-DAGs
# Associated paper: Gabain et al. (2025) Phil Trans R Soc B
# https://doi.org/10.1098/rstb.2025.0040

library(DiagrammeR)


child_under6_graph_code <- "
digraph dag {
    # Default node style
    node [shape = box, style = filled, color = lightblue, fontsize = 30];
    
    # Highlight exposure and outcome with bold font
    \"Helminth infection\" [fontname = \"Helvetica-Bold\"];
    \"Childhood stunting\" [fontname = \"Helvetica-Bold\"];
    \"Birth weight\" [fontname = \"Helvetica-Bold\"];
    
    # Base nodes (not repeating the bold ones)
    \"Anthelmintic treatment\"; 
    \"Mid-parental height\"; \"EED\"; \"Systemic inflammation\"; \"Micronutrient status\";
    \"Wasting\"; \"Anaemia\"; \"Diarrhoea\"; \"Macronutrient status\"; \"Age\";
    \"Sex\"; \"SES\"; \"Other infections\"; \"Geographical location\"; \"WASH\";
    \"Healthcare access\"; \"Parental education\"; \"Ethnicity\"; \"Breastfeeding status\";
    \"Microbiome\";

    # Edges in the original order with appropriate styling
    \"Helminth infection\" -> \"Childhood stunting\" [color=red];  # #1 - Bidirectional (red but same direction)
    \"Anthelmintic treatment\" -> \"Helminth infection\";
    \"Birth weight\" -> \"Childhood stunting\";
    \"Mid-parental height\" -> \"Childhood stunting\";
    \"Helminth infection\" -> \"EED\";
    \"EED\" -> \"Systemic inflammation\";
    \"EED\" -> \"Micronutrient status\" [color=red];  # #7 - Bidirectional
    \"Helminth infection\" -> \"Wasting\" [color=red];  # #8 - Bidirectional
    \"Systemic inflammation\" -> \"Macronutrient status\";
    \"Helminth infection\" -> \"Anaemia\";
    \"Anaemia\" -> \"Childhood stunting\";
    \"Sex\" -> \"Anaemia\";
    \"Micronutrient status\" -> \"Anaemia\";
    \"Systemic inflammation\" -> \"Anaemia\";
    \"Helminth infection\" -> \"Diarrhoea\";
    \"Diarrhoea\" -> \"Macronutrient status\";
    \"Diarrhoea\" -> \"Micronutrient status\" [color=red];  # #17 - Bidirectional
    \"Age\" -> \"Helminth infection\";
    \"Helminth infection\" -> \"Macronutrient status\" [color=red];  # #19 - Bidirectional
    \"Macronutrient status\" -> \"Childhood stunting\";
    \"Helminth infection\" -> \"Micronutrient status\" [color=red];  # #21 - Bidirectional
    \"Micronutrient status\" -> \"Systemic inflammation\" [color=red];  # #22 - Bidirectional
    \"Micronutrient status\" -> \"Childhood stunting\";
    \"Systemic inflammation\" -> \"Childhood stunting\";
    \"Helminth infection\" -> \"Systemic inflammation\";
    \"Other infections\" -> \"Systemic inflammation\";
    \"Wasting\" -> \"Childhood stunting\";
    \"Other infections\" -> \"Wasting\" [color=red];   #28 - Bidirectional
    \"Geographical location\" -> \"WASH\";
    \"Geographical location\" -> \"Healthcare access\";
    \"Geographical location\" -> \"Other infections\";
    \"Geographical location\" -> \"Helminth infection\";
    \"Parental education\" -> \"SES\";
    \"SES\" -> \"WASH\";
    \"SES\" -> \"Healthcare access\";
    \"SES\" -> \"Breastfeeding status\";
    \"SES\" -> \"Other infections\";
    \"SES\" -> \"Helminth infection\";
    \"Parental education\" -> \"WASH\";
    \"Parental education\" -> \"Healthcare access\";
    \"Parental education\" -> \"Breastfeeding status\";
    \"Parental education\" -> \"Other infections\";
    \"Parental education\" -> \"Helminth infection\";
    \"Ethnicity\" -> \"WASH\";
    \"Ethnicity\" -> \"Breastfeeding status\";
    \"WASH\" -> \"Other infections\";
    \"WASH\" -> \"Helminth infection\";
    \"Healthcare access\" -> \"Breastfeeding status\";
    \"Healthcare access\" -> \"Other infections\";
    \"Healthcare access\" -> \"Birth weight\";
    \"Healthcare access\" -> \"Helminth infection\";
    \"Healthcare access\" -> \"Anaemia\";
    \"Breastfeeding status\" -> \"Anaemia\" [color=red];
    \"Sex\" -> \"Breastfeeding status\";
    \"Sex\" -> \"Other infections\";
    \"Sex\" -> \"Helminth infection\";
    \"Sex\" -> \"Birth weight\";
    \"Age\" -> \"Breastfeeding status\";
    \"Age\" -> \"Other infections\";
    \"Breastfeeding status\" -> \"Other infections\";
    \"Breastfeeding status\" -> \"Helminth infection\" [color=red];  # #59 - Bidirectional
    \"Birth weight\" -> \"Breastfeeding status\";
    \"Helminth infection\" -> \"Other infections\" [color=red];  # #61 - Bidirectional
    \"Other infections\" -> \"Childhood stunting\";
    \"Birth weight\" -> \"Helminth infection\";
    \"Breastfeeding status\" -> \"Macronutrient status\" [color=red];  // #
    \"Other infections\" -> \"Macronutrient status\" [color=red];  # #65 - Bidirectional
    \"Breastfeeding status\" -> \"Micronutrient status\" [color=red];  // #
    \"Other infections\" -> \"Micronutrient status\" [color=red];  # #67 - Bidirectional
    \"Breastfeeding status\" -> \"EED\";
    \"Other infections\" -> \"EED\";
    \"Breastfeeding status\" -> \"Systemic inflammation\" [color=red];
    \"Other infections\" -> \"Anaemia\";
    \"Healthcare access\" -> \"Diarrhoea\";
    \"Other infections\" -> \"Diarrhoea\";
    \"Birth weight\" -> \"Wasting\";
    \"Helminth infection\" -> \"Microbiome\" [color=red];  # #75 - Bidirectional
    \"Breastfeeding status\" -> \"Microbiome\";
    \"Microbiome\" -> \"Micronutrient status\" [color=red];  # #77 - Bidirectional
    \"Microbiome\" -> \"Macronutrient status\" [color=red];  # #78 - Bidirectional
    \"Microbiome\" -> \"EED\" [color=red];   #79 - Bidirectional
    \"Microbiome\" -> \"Systemic inflammation\" [color=red];  # #80 - Bidirectional
    \"Diarrhoea\" -> \"Microbiome\" [color=red];  #  - Bidirectional
    \"Other infections\" -> \"Microbiome\" [color=red];  # #78 - Bidirectional
    
    # New from expert review
    \"Diarrhoea\" -> \"EED\";
    \"EED\" -> \"Macronutrient status\" [color=red];

}
"