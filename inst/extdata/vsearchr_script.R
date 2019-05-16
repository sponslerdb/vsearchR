### Load vsearch output
trnL_CT <- load_blast6("~/vsearchr/inst/extdata/trnL_vsearch_CT.output/")
ITS2_CT <- load_blast6("~/vsearchr/inst/extdata/ITS2_vsearch_CT.output/pollen/")

trnL_PH_pollen <- load_blast6("~/vsearchr/inst/extdata/trnL_vsearch_philly.output/pollen/")
ITS1_PH_pollen <- load_blast6("~/vsearchr/inst/extdata/ITS1_vsearch_philly.output/pollen/")
ITS2_PH_pollen <- load_blast6("~/vsearchr/inst/extdata/ITS2_vsearch_philly.output/pollen/")
# write_csv(trnL_PH_pollen, "trnL_PH_pollen.csv")
# write_csv(ITS1_PH_pollen, "ITS1_PH_pollen.csv")
# write_csv(ITS2_PH_pollen, "ITS2_PH_pollen.csv")
# trnL_PH_pollen <- read_csv("trnL_PH_pollen.csv", col_names = TRUE)
# ITS1_PH_pollen <- read_csv("ITS1_PH_pollen.csv", col_names = TRUE)
# ITS2_PH_pollen <- read_csv("ITS2_PH_pollen.csv", col_names = TRUE)


trnL_PH_honey <- load_blast6("~/vsearchr/inst/extdata/trnL_vsearch_philly.output/honey/")
ITS1_PH_honey <- load_blast6("~/vsearchr/inst/extdata/ITS1_vsearch_philly.output/honey/")
ITS2_PH_honey <- load_blast6("~/vsearchr/inst/extdata/ITS2_vsearch_philly.output/honey/")
# write_csv(trnL_PH_honey, "trnL_PH_honey.csv")
# write_csv(ITS1_PH_honey, "ITS1_PH_honey.csv")
# write_csv(ITS2_PH_honey, "ITS2_PH_honey.csv")
# trnL_PH_honey <- read_csv("trnL_PH_honey.csv", col_names = TRUE)
# ITS1_PH_honey <- read_csv("ITS1_PH_honey.csv", col_names = TRUE)
# ITS2_PH_honey <- read_csv("ITS2_PH_honey.csv", col_names = TRUE)

trnL_PH_jarred_honey <- load_blast6("~/vsearchr/inst/extdata/trnL_vsearch_philly.output/jarred_honey/")
ITS1_PH_jarred_honey <- load_blast6("~/vsearchr/inst/extdata/ITS1_vsearch_philly.output/jarred_honey/")
ITS2_PH_jarred_honey <- load_blast6("~/vsearchr/inst/extdata/ITS2_vsearch_philly.output/jarred_honey/")

trnL_PH_blanks <- load_blast6("~/vsearchr/inst/extdata/trnL_vsearch_philly.output/blanks/")
ITS1_PH_blanks <- load_blast6("~/vsearchr/inst/extdata/ITS1_vsearch_philly.output/blanks/")
ITS2_PH_blanks <- load_blast6("~/vsearchr/inst/extdata/ITS2_vsearch_philly.output/blanks/")


# Load taxonomy tables
trnL_CT_tax <- load_MTXA("~/vsearchr/inst/extdata/trnL_CT_Amplicons.tax")
ITS2_CT_tax <- load_MTXA("~/vsearchr/inst/extdata/ITS2_CT_Amplicons.tax")

trnL_PH_tax <- load_MTXA("~/vsearchr/inst/extdata/trnL_PH_Amplicons.tax")
ITS1_PH_tax <- load_MTXA("~/vsearchr/inst/extdata/ITS1_PH_Amplicons.tax")
ITS2_PH_tax <- load_MTXA("~/vsearchr/inst/extdata/ITS2_PH_Amplicons.tax")

# Join vsearch output to taxonomy tables
trnL_CT_join <- tax_join(trnL_CT, trnL_CT_tax, min_id = 0.97)
ITS2_CT_join <- tax_join(ITS2_CT, ITS2_CT_tax, min_id = 0.95)

trnL_PH_pollen_join <- tax_join(trnL_PH_pollen, trnL_PH_tax, min_id = 0.97)
ITS1_PH_pollen_join <- tax_join(ITS1_PH_pollen, ITS1_PH_tax, min_id = 0.95)
ITS2_PH_pollen_join <- tax_join(ITS2_PH_pollen, ITS2_PH_tax, min_id = 0.95)
# write_csv(trnL_PH_pollen_join, "trnL_PH_pollen_join.csv")
# write_csv(ITS1_PH_pollen_join, "ITS1_PH_pollen_join.csv")
# write_csv(ITS2_PH_pollen_join, "ITS2_PH_pollen_join.csv")
# trnL_PH_pollen_join <- read_csv("trnL_PH_pollen_join.csv", col_names = TRUE)
# ITS1_PH_pollen_join <- read_csv("ITS1_PH_pollen_join.csv", col_names = TRUE)
# ITS2_PH_pollen_join <- read_csv("ITS2_PH_pollen_join.csv", col_names = TRUE)

trnL_PH_honey_join <- tax_join(trnL_PH_honey, trnL_PH_tax, min_id = 0.97)
ITS1_PH_honey_join <- tax_join(ITS1_PH_honey, ITS1_PH_tax, min_id = 0.95)
ITS2_PH_honey_join <- tax_join(ITS2_PH_honey, ITS2_PH_tax, min_id = 0.95)
# write_csv(trnL_PH_honey_join, "trnL_PH_honey_join.csv")
# write_csv(ITS1_PH_honey_join, "ITS1_PH_honey_join.csv")
# write_csv(ITS2_PH_honey_join, "ITS2_PH_honey_join.csv")
# trnL_PH_honey_join <- read_csv("trnL_PH_honey_join.csv", col_names = TRUE)
# ITS1_PH_honey_join <- read_csv("ITS1_PH_honey_join.csv", col_names = TRUE)
# ITS2_PH_honey_join <- read_csv("ITS2_PH_honey_join.csv", col_names = TRUE)

trnL_PH_jarred_honey_join <- tax_join(trnL_PH_jarred_honey, trnL_PH_tax, min_id = 0.97)
ITS1_PH_jarred_honey_join <- tax_join(ITS1_PH_jarred_honey, ITS1_PH_tax, min_id = 0.95)
ITS2_PH_jarred_honey_join <- tax_join(ITS2_PH_jarred_honey, ITS2_PH_tax, min_id = 0.95)

trnL_PH_blanks_join <- tax_join(trnL_PH_blanks, trnL_PH_tax, min_id = 0.97)
ITS1_PH_blanks_join <- tax_join(ITS1_PH_blanks, ITS1_PH_tax, min_id = 0.95)
ITS2_PH_blanks_join <- tax_join(ITS2_PH_blanks, ITS2_PH_tax, min_id = 0.95)

# Tally genera by sample
trnL_CT_tally <- tally_gen(trnL_CT_join)
ITS2_CT_tally <- tally_gen(ITS2_CT_join)

trnL_PH_pollen_tally <- tally_gen(trnL_PH_pollen_join)
ITS1_PH_pollen_tally <- tally_gen(ITS1_PH_pollen_join)
ITS2_PH_pollen_tally <- tally_gen(ITS2_PH_pollen_join)

trnL_PH_honey_tally <- tally_gen(trnL_PH_honey_join)
ITS1_PH_honey_tally <- tally_gen(ITS1_PH_honey_join)
ITS2_PH_honey_tally <- tally_gen(ITS2_PH_honey_join)

trnL_PH_jarred_honey_tally <- tally_gen(trnL_PH_jarred_honey_join)
ITS1_PH_jarred_honey_tally <- tally_gen(ITS1_PH_jarred_honey_join)
ITS2_PH_jarred_honey_tally <- tally_gen(ITS2_PH_jarred_honey_join)

trnL_PH_blanks_tally <- tally_gen(trnL_PH_blanks_join)
ITS1_PH_blanks_tally <- tally_gen(ITS1_PH_blanks_join)
ITS2_PH_blanks_tally <- tally_gen(ITS2_PH_blanks_join)

# Add metadata
trnL_CT_final <- add_meta(trnL_CT_tally, "~/vsearchr/inst/extdata/CT_2015_key.csv")
ITS2_CT_final <- add_meta(ITS2_CT_tally, "~/vsearchr/inst/extdata/CT_2015_key.csv")
CT_consensus <- consensus_x2(ITS2_CT_final, trnL_CT_final)

trnL_PH_pollen_final <- add_meta(trnL_PH_pollen_tally, "~/vsearchr/inst/extdata/PH_2017_key.csv")
ITS1_PH_pollen_final <- add_meta(ITS1_PH_pollen_tally, "~/vsearchr/inst/extdata/PH_2017_key.csv")
ITS2_PH_pollen_final <- add_meta(ITS2_PH_pollen_tally, "~/vsearchr/inst/extdata/PH_2017_key.csv")
PH_pollen_consensus <- consensus_xyz_gen(trnL_PH_pollen_final, ITS1_PH_pollen_final, ITS2_PH_pollen_final,
                                         min_prop = 0.001, xname = "trnL", yname = "ITS1", zname = "ITS2") %>%
  add_meta("~/vsearchr/inst/extdata/PH_2017_key.csv")

trnL_PH_honey_final <- add_meta(trnL_PH_honey_tally, "~/vsearchr/inst/extdata/PH_2017_key.csv")
ITS1_PH_honey_final <- add_meta(ITS1_PH_honey_tally, "~/vsearchr/inst/extdata/PH_2017_key.csv")
ITS2_PH_honey_final <- add_meta(ITS2_PH_honey_tally, "~/vsearchr/inst/extdata/PH_2017_key.csv")
PH_honey_consensus <- consensus_x3(trnL_PH_honey_final, ITS1_PH_honey_final, ITS2_PH_honey_final)

trnL_PH_jarred_honey_final <- add_meta(trnL_PH_jarred_honey_tally, "~/vsearchr/inst/extdata/PH_2017_key.csv")
ITS1_PH_jarred_honey_final <- add_meta(ITS1_PH_jarred_honey_tally, "~/vsearchr/inst/extdata/PH_2017_key.csv")
ITS2_PH_jarred_honey_final <- add_meta(ITS2_PH_jarred_honey_tally, "~/vsearchr/inst/extdata/PH_2017_key.csv")
PH_jarred_honey_consensus <- consensus_x3(trnL_PH_jarred_honey_final, ITS1_PH_jarred_honey_final, ITS2_PH_jarred_honey_final)

trnL_PH_blanks_final <- add_meta(trnL_PH_blanks_tally, "~/vsearchr/inst/extdata/PH_2017_key.csv")
ITS1_PH_blanks_final <- add_meta(ITS1_PH_blanks_tally, "~/vsearchr/inst/extdata/PH_2017_key.csv")
ITS2_PH_blanks_final <- add_meta(ITS2_PH_blanks_tally, "~/vsearchr/inst/extdata/PH_2017_key.csv")
PH_blanks_consensus <- consensus_x3(trnL_PH_blanks_final, ITS1_PH_blanks_final, ITS2_PH_blanks_final)


###################################################################################################


# Plot CT
ggplot(filter(trnL_CT_final, gen_prop >= 0.01), aes(x = date, y = genus, fill = gen_prop)) +
  geom_tile(width = 32, color = "white") +
  scale_fill_gradient(low = "gray95", high = "purple") +
  theme_bw(12) +
  ylab("Genus") +
  xlab("Sample") +
  labs(fill = "Proportional\nabundance") +
  facet_grid(~site) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(filter(ITS2_CT_final, gen_prop >= 0.01), aes(x = date, y = genus, fill = gen_prop)) +
  geom_tile(width = 8, color = "white") +
  scale_fill_gradient(low = "gray95", high = "purple") +
  theme_bw(12) +
  ylab("Genus") +
  xlab("Sample") +
  labs(fill = "Proportional\nabundance") +
  facet_grid(~site) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(filter(CT_consensus, mean_gen_prop >= 0.01), aes(x = date, y = genus, fill = mean_gen_prop)) +
  geom_tile(width = 8, color = "white") +
  scale_fill_gradient(low = "gray95", high = "purple") +
  theme_bw(12) +
  ylab("Genus") +
  xlab("Sample") +
  labs(fill = "Proportional\nabundance") +
  facet_grid(~site) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

##############################################

# Plot Philly pollen
ggplot(filter(trnL_PH_pollen_final, gen_prop >= 0.01), aes(x = date, y = genus, fill = gen_prop)) +
  geom_tile(width = 32, color = "white") +
  scale_fill_gradient(low = "gray95", high = "purple") +
  theme_bw(12) +
  ylab("Genus") +
  xlab("Sample") +
  labs(fill = "Proportional\nabundance") +
  facet_grid(~site) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(filter(ITS1_PH_pollen_final, gen_prop >= 0.01), aes(x = date, y = genus, fill = gen_prop)) +
  geom_tile(width = 12, color = "white") +
  scale_fill_gradient(low = "gray95", high = "purple") +
  theme_bw(12) +
  ylab("Genus") +
  xlab("Sample") +
  labs(fill = "Proportional\nabundance") +
  facet_grid(~site) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Plot
ggplot(filter(ITS2_PH_pollen_final, gen_prop >= 0.01), aes(x = date, y = genus, fill = gen_prop)) +
  geom_tile(width = 12, color = "white") +
  scale_fill_gradient(low = "gray95", high = "purple") +
  theme_bw(12) +
  ylab("Genus") +
  xlab("Sample") +
  labs(fill = "Proportional\nabundance") +
  facet_grid(~site) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Plot
ggplot(filter(PH_pollen_consensus, scaled_prop >= 0.025), aes(x = date, y = genus, fill = scaled_prop)) +
  geom_tile(width = 32, color = "white") +
  scale_fill_gradient(low = "gray95", high = "purple") +
  theme_bw(12) +
  ylab("Genus") +
  xlab("Sample") +
  labs(fill = "Proportional\nabundance") +
  facet_grid(~site) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))


# Plot Philly jarred honey
ggplot(filter(trnL_PH_jarred_honey_final, gen_prop >= 0.025), aes(x = sample, y = genus, fill = gen_prop)) +
  geom_tile(width = 32, color = "white") +
  scale_fill_gradient(low = "gray95", high = "purple") +
  theme_bw(12) +
  ylab("Genus") +
  xlab("Sample") +
  labs(fill = "Proportional\nabundance") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(filter(ITS1_PH_jarred_honey_final, gen_prop >= 0.01), aes(x = sample, y = genus, fill = gen_prop)) +
  geom_tile(width = 32, color = "white") +
  scale_fill_gradient(low = "gray95", high = "purple") +
  theme_bw(12) +
  ylab("Genus") +
  xlab("Sample") +
  labs(fill = "Proportional\nabundance") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Plot
ggplot(filter(ITS2_PH_jarred_honey_final, gen_prop >= 0.01), aes(x = date, y = genus, fill = gen_prop)) +
  geom_tile(width = 32, color = "white") +
  scale_fill_gradient(low = "gray95", high = "purple") +
  theme_bw(12) +
  ylab("Genus") +
  xlab("Sample") +
  labs(fill = "Proportional\nabundance") +
  facet_grid(~site) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# Plot
ggplot(filter(PH_jarred_honey_consensus, med_gen_prop >= 0.01), aes(x = date, y = genus, fill = med_gen_prop)) +
  geom_tile(width = 32, color = "white") +
  scale_fill_gradient(low = "gray95", high = "purple") +
  theme_bw(12) +
  ylab("Genus") +
  xlab("Sample") +
  labs(fill = "Proportional\nabundance") +
  facet_grid(~site) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
