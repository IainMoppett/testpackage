#' Create a set of QR codes
#'
#' \code{QR_save} is a wrapper of \code{qrcode} that takes a formatted csv file of URLs
#' and titles and then saves the QR codes with appropriate titles. Useful for supporting presentations.
#'
#' @param data A csv filepath - formatted as URL and Title
#' @return Pdf(s) of QR codes, saved to the current folder, named as "QR_Title.pdf"

#' @export

QR_save <- function(data){
  tbl_QR <- readr::read_csv(data)

  for (i in 1:nrow(tbl_QR)) {
    qr_1 <- qrcode::qr_code(tbl_QR$URL[i])
    filename <- paste0("QR_", tbl_QR$Title[i], ".pdf")
    # Open a pdf file
    pdf(filename)
    # 2. Create a plot
    plot(qr_1)
    # Close the pdf file
    dev.off() }
}
