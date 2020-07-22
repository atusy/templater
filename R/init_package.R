usethis_description = function(package) {
  getOption(
    'usethis.description',
    list(
      `Authors@R` = 'person(given = "Atsushi",
                                family = "Yasumoto",
                                role = c("aut", "cph", "cre"),
                                email = "atusy.rpkg@gmail.com",
                                comment = c(ORCID = "0000-0002-8335-495X"))',
      Maintainer = 'Atsushi Yasumoto <atusy.rpkg@gmail.com>',
      URL = sprintf('https://%s.atusy.net, https://github.com/atusy/%s',
                    package, package),
      Language = "en-US"
    )
  )
}
usethis_full_name = function() {
  getOption("usethis.full_name", "Atsushi Yasumoto")
}


#' Initialize package after `usethis::create_package()`
#'
#' TODO: create repository, commit, and push automatically. Support covr. Build
#' pkgdown site automatically on Netlify.
#'
#' @param path A path to the package
#' @param package A name of the package
init_package <- function(path = getwd(), package = basename(path)) {
  cwd = getwd()
  on.exit(setwd(cwd))
  setwd(path)

  usethis::use_news_md() # must run when nothing to commit
  download.file('https://raw.githubusercontent.com/github/gitignore/master/R.gitignore', '.gitignore')
  unlink(c('DESCRIPTION', 'README.md'))
  usethis::use_description(usethis_description(package))
  usethis::use_mit_license(usethis_full_name())
  usethis::use_readme_md()
  usethis::use_cran_badge()
  usethis::use_mit_license()
  usethis::use_spell_check()
  usethis::use_roxygen_md()
  usethis::use_testthat()
  usethis::use_pkgdown()
  try(usethis::use_github_action_check_full())
}
