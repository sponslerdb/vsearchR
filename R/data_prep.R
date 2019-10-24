#' \code{load_blast6} imports blast6-formatted VSEARCH output files from a given directory and merges them into a single tibble
#'
#' @param x A file path to directory containing (only) VSEARCH output files
#' @return A tibble
load_blast6 <- function(x) {
  setwd(x)
  map(list.files(path = ".",
                 pattern = "*.txt",
                 full.names = TRUE,
                 ignore.case = TRUE),
      proc_blast6) %>%
    bind_rows()
}


#' \code{proc_blast6} processes blast6 input, assigning column names, adding a sample ID field, and extracting accession numbers into their own field
#'
#' @param x A VSEARCH blast6 output file
#' @return A tibble
proc_blast6 <- function(x) {
  read_tsv(x, col_names = c("qseqid", "sseqid", "pident", # read in file and add column names
                            "length", "mismatch", "gapopen",
                            "qstart", "qend", "sstart", "send",
                            "evalue", "bitscore"),
           guess_max = 100000) %>% # it is necessary to increase guess_max so that it will assign the correct data type and avoid parsing errors
  mutate(sample = rep(str_extract(x, "\\w+\\d+"))) %>% # add sample field
  dplyr::select(sample, qseqid, sseqid, pident, length, gapopen, qstart, qend, sstart, send, evalue, bitscore) %>%
    group_by(sample, qseqid) %>%
    slice(1)
}

#' \code{load_blast6_alt} imports blast6_alt-formatted VSEARCH output files from a given directory and merges them into a single tibble
#'
#' @param x A file path to directory containing (only) VSEARCH output files
#' @return A tibble
load_blast6_alt <- function(x) {
  setwd(x)
  map(list.files(path = ".",
                 pattern = "*.txt",
                 full.names = TRUE,
                 ignore.case = TRUE),
      proc_blast6_alt) %>%
    bind_rows()
}


#' \code{proc_blast6_alt} processes blast6_alt input, assigning column names, adding a sample ID field, and extracting accession numbers into their own field
#'
#' @param x A VSEARCH blast6_alt output file
#' @return A tibble
proc_blast6_alt <- function(x) {
  read_tsv(x, col_names = c("qseqid", "sseqid", "pident", # read in file and add column names
                            "length", "mismatch", "gapopen",
                            "qstart", "qend", "sstart", "send",
                            "evalue", "bitscore"),
           guess_max = 100000) %>% # it is necessary to increase guess_max so that it will assign the correct data type and avoid parsing errors
    mutate(sample = rep(x)) %>% # add sample field
    dplyr::select(sample, qseqid, sseqid, pident, length, gapopen, qstart, qend, sstart, send, evalue, bitscore) %>%
    group_by(sample, qseqid) %>%
    slice(1)
}


#' \code{load_MTXA} loads Metaxa2 formatted taxonomy table
#'
#' @param x A Metaxa2 formatted taxonomy table
#' @return A tibble
load_MTXA <- function(x) {
  read_tsv(x, col_names = c("sseqid", "tax_tree")) %>%
    separate(tax_tree, c("kingdom", "phylum", "class", "order",
                         "family", "genus", "species", "x"),
             fill = "warn", sep = ";", remove = TRUE) %>%
    dplyr::select(sseqid, family, genus, species) %>%
    mutate(family = str_remove(family, "f__"),
           genus = str_remove(genus, "g__"),
           species = str_remove(species, "s__"))
}


#' \code{tax_join} joins taxonomy table to vsearch output table
#'
#' @param seqs vsearch output table
#' @param tax taxonomy table
tax_join <- function(seqs, tax, min_id, min_len) {
  left_join(seqs, tax, by = "sseqid") %>%
    filter(pident >= min_id & length >= min_len)
}

#' \code{tally_gen} sums reads by genus for each sample, calculates proportional abundance, and culls rare genera whose proportional abundance is less than min_prop
#'
#' @param x A tibble produced by \code{taxonomize}
#' @param min_prop A real number specifying the minumum proportional abundance below which a taxon will be dropped as a likely false positive
#' @return A tibble
tally_gen <- function(x, min_prop = 0.0005) {
  x %>%
    group_by(sample, genus) %>%
    tally() %>% # sum reads by genus within each sample
    mutate(gen_prop = n/sum(n)) %>% # turn counts to proportions
    filter(gen_prop >= min_prop) %>% # remove genera falling below min_prop in abundance
    rename(read_count = n)
}

#' \code{tally_fam} sums reads by famiy for each sample, calculates proportional abundance, and culls rare families whose proportional abundance is less than min_prop
#'
#' @param x A tibble produced by \code{taxonomize}
#' @param min_prop A real number specifying the minumum proportional abundance below which a taxon will be dropped as a likely false positive
#' @return A tibble
tally_fam <- function(x, min_prop = 0.0005) {
  x %>%
    group_by(sample, family) %>%
    tally() %>% # sum reads by genus within each sample
    mutate(fam_prop = n/sum(n)) %>% # turn counts to proportions
    filter(fam_prop >= min_prop) %>% # remove genera falling below min_prop in abundance
    rename(read_count = n)
}



#' \code{add_meta} joins a set of metadata to data by sample field
#'
#' @param x a filepath to metadata file containing site field shared with data
#' @return a tibble containing site, hive, and date for each sample
add_meta <- function(x, y) {
  key <- read_csv(y, col_names = TRUE) %>%
    dplyr::select(sample, site, date)
  full_join(x, key, by = "sample") %>%
    mutate(date = lubridate::as_date(date)) %>%
    dplyr::select(sample, site, date, everything()) %>%
    arrange(site, date)
}

#' \code{add_meta_rbcL} joins a set of metadata to data by sample field
#'
#' @param x a filepath to metadata file containing site field shared with data
#' @return a tibble containing site, hive, and date for each sample
add_meta_rbcL <- function(x, y) {
  key <- read_csv(y, col_names = TRUE) %>%
    dplyr::select(sample, site, date)
  full_join(x, key, by = c("sample_mod" = "sample")) %>%
    mutate(date = lubridate::as_date(date)) %>%
    dplyr::select(sample, site, date, everything()) %>%
    arrange(site, date)
}

#' \code{add_meta_micro} joins a set of metadata to data by sample field
#'
#' @param x a filepath to metadata file containing site field shared with data
#' @return a tibble containing site, hive, and date for each sample
add_meta_micro <- function(x, y) {
  key <- read_csv(y, col_names = TRUE) %>%
    dplyr::select(sample, site, date)
  full_join(x, key, by = c("site", "date")) %>%
    dplyr::select(sample, site, date, everything()) %>%
    arrange(site, date)
}

consensus_xy <- function(x, y) {
  inner_join(x, y, by = c("sample", "genus")) %>%
    mutate(mean_gen_prop = (gen_prop.x + gen_prop.y)/2) %>%
    dplyr::select(sample, site = site.x, date = date.x, genus, gen_prop.x, gen_prop.y, mean_gen_prop) %>%
    group_by(sample) %>%
    mutate(scaled_prop = mean_gen_prop*(1/sum(mean_gen_prop)))
}

additive_xy <- function(x, y) {
  full_join(x, y, by = c("sample", "genus")) %>%
    replace_na(list(gen_prop.x = 0, gen_prop.y = 0)) %>%
    mutate(mean_gen_prop = (gen_prop.x + gen_prop.y)/2,
           site = coalesce(site.x, site.y),
           date = coalesce(date.x, date.y)) %>%
    dplyr::select(sample, site, date, genus, gen_prop.x, gen_prop.y, mean_gen_prop) %>%
    group_by(sample) %>%
    mutate(scaled_prop = mean_gen_prop*(1/sum(mean_gen_prop)))
}


#' \code{consensus_xyz_gen} returns taxa common to at least two of the marker datasets x, y, and z; reports median proportional read count
#'
#' @param x,y,z Tibbles output from \code{metaxize}
#' @param min_prop A real number specifying the minumum proportional abundance below which a taxon will be dropped as a likely false positive
#' @return a tibble
consensus_xyz_gen <- function(x, y, z, min_prop) {
  # taxa common to markers x and y
  xy <- inner_join(x, y, by = c("sample", "genus")) %>%
    dplyr::select(sample, genus)
  # taxa common to markers x and z
  xz <- inner_join(x, z, by = c("sample", "genus")) %>%
    dplyr::select(sample, genus)
  # taxa common to markers y and z
  yz <- inner_join(y, z, by = c("sample", "genus")) %>%
    dplyr::select(sample, genus)
  # taxa common to any two of x, y, and z
  sieve <- xy %>%
    full_join(xz, by = c("sample", "genus")) %>%
    full_join(yz, by = c("sample", "genus")) %>%
    dplyr::select(sample, genus)
  # filter original marker datasets by the taxa in the sieve dataset created above
  x_sieve <- semi_join(x, sieve, b = c("sample", "genus")) %>%
    dplyr::select(sample, genus, gen_prop)
  y_sieve <- semi_join(y, sieve, b = c("sample", "genus")) %>%
    dplyr::select(sample, genus, gen_prop)
  z_sieve <- semi_join(z, sieve, b = c("sample", "genus")) %>%
    dplyr::select(sample, genus, gen_prop)
  # join filtered marker datasets
  out <- full_join(x_sieve, y_sieve, by = c("sample", "genus")) %>%
    full_join(z_sieve, by = c("sample", "genus")) %>%
    rename(gen_prop.z = gen_prop)
  # calculate median read count proportions
  out <- out %>%
    rowwise() %>%
    mutate(med_prop = median(c(gen_prop.x, gen_prop.y, gen_prop.z),
                             na.rm = TRUE)) %>%
    filter(med_prop >= min_prop) %>% # filter to exclude taxa with a median proportional abundance of less than 0.1%
    group_by(sample) %>%
    mutate(scaled_prop = med_prop*(1/sum(med_prop))) # rescale median proportional abundance so that it totals to 1 for each sample
  return(out)
}
