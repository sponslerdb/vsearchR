### Load vsearch output
trnL_test_pollen <- load_blast6("~/vsearchr/inst/extdata/trnL_test_output/pollen/")
ITS1_test_pollen <- load_blast6("~/vsearchr/inst/extdata/ITS1_test_output/pollen/")
ITS2_test_pollen <- load_blast6("~/vsearchr/inst/extdata/ITS2_test_output/pollen/")

# write_csv(trnL_test_pollen, "trnL_test_pollen.csv")
# write_csv(ITS1_test_pollen, "ITS1_test_pollen.csv")
# write_csv(ITS2_test_pollen, "ITS2_test_pollen.csv")
# trnL_test_pollen <- read_csv("trnL_test_pollen.csv", col_names = TRUE)
# ITS1_test_pollen <- read_csv("ITS1_test_pollen.csv", col_names = TRUE)
# ITS2_test_pollen <- read_csv("ITS2_test_pollen.csv", col_names = TRUE)

# Load taxonomy tables
trnL_test_tax <- load_MTXA("~/vsearchr/inst/extdata/trnL_PH_Amplicons.tax")
ITS1_test_tax <- load_MTXA("~/vsearchr/inst/extdata/ITS1_PH_Amplicons.tax")
ITS2_test_tax <- load_MTXA("~/vsearchr/inst/extdata/ITS2_PH_Amplicons.tax")

# Join vsearch output to taxonomy tables
trnL_test_pollen_join <- tax_join(trnL_test_pollen, trnL_test_tax, min_id = 0.97)
ITS1_test_pollen_join <- tax_join(ITS1_test_pollen, ITS1_test_tax, min_id = 0.95)
ITS2_test_pollen_join <- tax_join(ITS2_test_pollen, ITS2_test_tax, min_id = 0.95)

# write_csv(trnL_test_pollen_join, "trnL_PH_pollen_join.csv")
# write_csv(ITS1_PH_pollen_join, "ITS1_PH_pollen_join.csv")
# write_csv(ITS2_PH_pollen_join, "ITS2_PH_pollen_join.csv")
# trnL_PH_pollen_join <- read_csv("trnL_PH_pollen_join.csv", col_names = TRUE)
# ITS1_PH_pollen_join <- read_csv("ITS1_PH_pollen_join.csv", col_names = TRUE)
# ITS2_PH_pollen_join <- read_csv("ITS2_PH_pollen_join.csv", col_names = TRUE)


# Tally genera by sample
trnL_PH_pollen_tally <- tally_gen(trnL_PH_pollen_join)
ITS1_PH_pollen_tally <- tally_gen(ITS1_PH_pollen_join)
ITS2_PH_pollen_tally <- tally_gen(ITS2_PH_pollen_join)

# Add metadata
trnL_PH_pollen_final <- add_meta(trnL_PH_pollen_tally, "~/vsearchr/inst/extdata/PH_2018_key.csv")
ITS1_PH_pollen_final <- add_meta(ITS1_PH_pollen_tally, "~/vsearchr/inst/extdata/PH_2018_key.csv")
ITS2_PH_pollen_final <- add_meta(ITS2_PH_pollen_tally, "~/vsearchr/inst/extdata/PH_2018_key.csv")
PH_pollen_consensus <- consensus_xyz_gen(trnL_PH_pollen_final, ITS1_PH_pollen_final, ITS2_PH_pollen_final,
                                         min_prop = 0.001, xname = "trnL", yname = "ITS1", zname = "ITS2") %>%
  add_meta("~/vsearchr/inst/extdata/PH_2018_key.csv")
