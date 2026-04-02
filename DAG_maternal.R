# DAG: Helminth infection -> Childhood stunting (maternal DAG)
# Method: ESC-DAGs
# Associated paper: Gabain et al. (2025) Phil Trans R Soc B
# https://doi.org/10.1098/rstb.2025.0040

library(DiagrammeR)


maternal_graph_code <- "
digraph dag {
    // Default node styles with increased font size
    node [shape = box, style = filled, color = lightblue, fontsize = 30];
    
    // Highlight exposure and outcome with bold font
    \"Maternal helminth infection\" [fontname = \"Helvetica-Bold\"];
    \"Childhood stunting\" [fontname = \"Helvetica-Bold\"];
    \"Birth weight\" [fontname = \"Helvetica-Bold\"];

    // Define edges with red color for edges that are part of bidirectional relationships
    \"Maternal helminth infection\" -> \"Birth weight\";  // #1
    \"Maternal helminth infection\" -> \"Childhood stunting\";  // #2
    \"Maternal anthelmintic treatment\" -> \"Maternal helminth infection\";  // #3
    \"Maternal reproductive patterns\" -> \"Birth weight\";  // #4
    \"Maternal reproductive patterns\" -> \"Childhood stunting\";  // #5
    \"Abnormal/complicated pregnancy factors\" -> \"Birth weight\";  // #6
    \"Geographical location\" -> \"Healthcare access\";  // #7
    \"Geographical location\" -> \"SES\" [color=red];  // #8 - Bidirectional
    \"Geographical location\" -> \"WASH\";  // #9
    \"Geographical location\" -> \"Maternal helminth infection\";  // #10
    \"Geographical location\" -> \"Maternal age (at pregnancy)\";  // #11
    \"Geographical location\" -> \"Maternal dietary intake\";  // #12
    \"Geographical location\" -> \"Maternal other infections\";  // #13
    \"Maternal ethnicity\" -> \"Healthcare access\";  // #14
    \"Maternal ethnicity\" -> \"SES\";  // #15
    \"Maternal ethnicity\" -> \"WASH\";  // #16
#    \"Ethnicity\" -> \"Maternal age (at pregnancy)\";  // #17
    \"Maternal ethnicity\" -> \"Maternal dietary intake\";  // #19
    \"SES\" -> \"Healthcare access\";  // #20
    \"Healthcare access\" -> \"Maternal helminth infection\";  // #21
    \"Healthcare access\" -> \"Birth weight\";  // #22
    \"Maternal age (at pregnancy)\" -> \"Healthcare access\";  // #23
    \"Healthcare access\" -> \"Maternal anaemia\";  // #24
    \"Healthcare access\" -> \"Maternal other infections\";  // #25
    \"SES\" -> \"WASH\";  // #26
    \"SES\" -> \"Maternal helminth infection\";  // #27
    \"SES\" -> \"Maternal age (at pregnancy)\";  // #28
    \"SES\" -> \"Maternal dietary intake\";  // #29
    \"WASH\" -> \"Maternal helminth infection\";  // #30
    \"WASH\" -> \"Maternal other infections\";  // #31
    \"Maternal age (at pregnancy)\" -> \"Maternal helminth infection\";  // #32
    \"Maternal helminth infection\" -> \"Maternal anaemia\";  // #33
    \"Maternal helminth infection\" -> \"Maternal dietary intake\";  // #34
    \"Maternal helminth infection\" -> \"Maternal micronutrient status\" [color=red];  // #35 - Bidirectional
    \"Maternal helminth infection\" -> \"Maternal macronutrient status\" [color=red];  // #36 - Bidirectional
    \"Maternal helminth infection\" -> \"Maternal other infections\" [color=red];  // #37 - Bidirectional
    \"Maternal helminth infection\" -> \"Maternal systemic inflammation\";  // #38
    \"Maternal helminth infection\" -> \"Maternal diarrhoea\";  // #39
    \"Birth weight\" -> \"Childhood stunting\";  // #40
    \"Maternal anaemia\" -> \"Childhood stunting\";  // #41
    \"Maternal micronutrient status\" -> \"Childhood stunting\";  // #42
    \"Maternal macronutrient status\" -> \"Childhood stunting\";  // #43
    \"Maternal systemic inflammation\" -> \"Childhood stunting\";  // #44
    \"Maternal age (at pregnancy)\" -> \"Birth weight\";  // #45
    \"Maternal anaemia\" -> \"Birth weight\";  // #46
    \"Maternal micronutrient status\" -> \"Birth weight\";  // #47
    \"Maternal macronutrient status\" -> \"Birth weight\";  // #48
    \"Maternal other infections\" -> \"Birth weight\";  // #49
    \"Maternal systemic inflammation\" -> \"Birth weight\";  // #50
    \"Maternal age (at pregnancy)\" -> \"Maternal dietary intake\";  // #51
    \"Maternal micronutrient status\" -> \"Maternal anaemia\";  // #52
    \"Maternal macronutrient status\" -> \"Maternal anaemia\";  // #53
    \"Maternal other infections\" -> \"Maternal anaemia\";  // #54
    \"Maternal systemic inflammation\" -> \"Maternal anaemia\";  // #55
    \"Maternal diarrhoea\" -> \"Maternal anaemia\";  // #56
    \"Maternal dietary intake\" -> \"Maternal micronutrient status\";  // #57
    \"Maternal dietary intake\" -> \"Maternal macronutrient status\";  // #58
    \"Maternal other infections\" -> \"Maternal micronutrient status\" [color=red];  // #59 - Bidirectional
    \"Maternal micronutrient status\" -> \"Maternal systemic inflammation\" [color=red];  // #60 - Bidirectional
    \"Maternal diarrhoea\" -> \"Maternal micronutrient status\";  // #61
    \"Maternal other infections\" -> \"Maternal macronutrient status\" [color=red];  // #62 - Bidirectional
    \"Maternal macronutrient status\" -> \"Maternal systemic inflammation\" [color=red];  // #63 - Bidirectional
    \"Maternal diarrhoea\" -> \"Maternal macronutrient status\";  // #64
    \"Maternal other infections\" -> \"Maternal systemic inflammation\";  // #65
    \"Maternal other infections\" -> \"Maternal diarrhoea\";  // #66
    \"Geographical location\" -> \"Maternal reproductive patterns\";  // #67
    \"Maternal ethnicity\" -> \"Maternal reproductive patterns\";  // #68
    \"Healthcare access\" -> \"Maternal reproductive patterns\";  // #69
    \"SES\" -> \"Maternal reproductive patterns\";  // #70
    \"Maternal age (at pregnancy)\" -> \"Maternal reproductive patterns\";  // #71
    \"Healthcare access\" -> \"Abnormal/complicated pregnancy factors\";  // #72
    \"SES\" -> \"Abnormal/complicated pregnancy factors\";  // #73
    \"Maternal reproductive patterns\" -> \"Abnormal/complicated pregnancy factors\";  // #74
    \"Maternal age (at pregnancy)\" -> \"Abnormal/complicated pregnancy factors\";  // #75
    \"Geographical location\" -> \"Maternal smoking/alcohol consumption\";  // #76
    \"Maternal ethnicity\" -> \"Maternal smoking/alcohol consumption\";  // #77
    \"Healthcare access\" -> \"Maternal smoking/alcohol consumption\";  // #78
    \"SES\" -> \"Maternal smoking/alcohol consumption\";  // #79
    \"Maternal smoking/alcohol consumption\" -> \"Birth weight\";  // #80
    \"Maternal age (at pregnancy)\" -> \"Maternal smoking/alcohol consumption\";  // #81
    \"Maternal smoking/alcohol consumption\" -> \"Maternal anaemia\";  // #82
    \"Maternal smoking/alcohol consumption\" -> \"Maternal dietary intake\";  // #83
    \"Maternal smoking/alcohol consumption\" -> \"Maternal micronutrient status\";  // #84
    \"Maternal smoking/alcohol consumption\" -> \"Maternal systemic inflammation\";  // #85
    \"Maternal ethnicity\" -> \"Maternal BMI\";  // #86
    \"Maternal helminth infection\" -> \"Maternal BMI\";  // #87
    \"Maternal BMI\" -> \"Birth weight\";  // #88
    \"Maternal micronutrient status\" -> \"Maternal BMI\";  // #89
    \"Maternal macronutrient status\" -> \"Maternal BMI\";  // #90
    \"Maternal other infections\" -> \"Maternal BMI\" [color=red];  // #91 - Bidirectional
    \"Maternal BMI\" -> \"Maternal systemic inflammation\";  // #92
    \"Maternal smoking/alcohol consumption\" -> \"Maternal BMI\";  // #93
    \"Maternal BMI\" -> \"Abnormal/complicated pregnancy factors\";  // #94
    \"Maternal ethnicity\" -> \"Mid-parental height\";  // #95
    \"Mid-parental height\" -> \"Childhood stunting\";  // #96
    \"Mid-parental height\" -> \"Birth weight\";  // #97
    
    # New from expert review
    \"Maternal dietary intake\" -> \"Maternal BMI\";  // 
    \"Maternal diarrhoea\" -> \"Maternal dietary intake\";  //
    
    # Add food security node
    \"Geographical location\" -> \"Food security\";  //
    \"Maternal education\" -> \"Food security\";  //
    \"SES\" -> \"Food security\";  //
    \"Food security\" -> \"Maternal dietary intake\";  //
    
    # Add maternal education node
    \"Maternal ethnicity\" -> \"Maternal education\";  //
    \"Maternal education\" -> \"SES\";  //
    \"Maternal education\" -> \"Healthcare access\";  //
    \"Maternal education\" -> \"WASH\";  //
    \"Maternal education\" -> \"Maternal helminth infection\";  //
    \"Maternal education\" -> \"Maternal age (at pregnancy)\";  //
    \"Maternal education\" -> \"Maternal dietary intake\";  //
    \"Maternal education\" -> \"Maternal other infections\";  //
    \"Maternal education\" -> \"Maternal reproductive patterns\";  //
    \"Maternal education\" -> \"Maternal smoking/alcohol consumption\";  //
}
"