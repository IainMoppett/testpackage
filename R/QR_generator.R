#' Create a set of QR codes
#'
#' \code{QR_save} is a wrapper of \code{qrcode} that takes either a dataframe or formatted csv file of URLs
#' and titles and then saves the QR codes with appropriate titles. Useful for supporting presentations.
#'
#' @param data Either: A a data.frame or a csv filepath - columns labelled as URL and Title
#' @return Pdf(s) of QR codes, saved to the current folder, named as "QR_Title.pdf"
#'
#' @examples
#' df <- data.frame(URL = c("https://www.rstudio.com", "https://hip-fracture-app.web.app"), Title = c("RStudio", "HipFractureApp"))
#' QR_save(df)

#' @export

QR_save <- function(data){
  if (any(class(data) %in% ("data.frame"))) tbl_QR <- data else
    if (tools::file_ext(data) =="csv") {
      tbl_QR <- readr::read_csv(data)
    } else {stop("Wrong file type: use either a data.frame or csv file")}

  for (i in 1:nrow(tbl_QR)) {
    qr_1 <- qrcode::qr_code(tbl_QR$URL[i])
    filename <- paste0("QR_", tbl_QR$Title[i], ".pdf")
    # Open a pdf file
    grDevices::pdf(filename)
    # 2. Create a plot
    plot(qr_1)
    # Close the pdf file
    grDevices::dev.off() }
}
