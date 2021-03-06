KMg.plot <-
function(x, y, file, var.label.x, var.label.y, ...)   
{

  kk<-!is.na(x) & !is.na(y)
  x<-x[kk]
  y<-y[kk]
  
  dots.args <- eval(substitute(alist(...))) 
  onefile <- FALSE
  if (!is.null(dots.args$onefile))
    onefile<- dots.args$onefile  

  if (is.null(file))
    {} #dev.new()
  else {
    if (length(grep("bmp$",file)))
      bmp(file,...) 
    if (length(grep("png$",file)))
      png(file,...)  
    if (length(grep("tif$",file)))
      tiff(file,...)  
    if (length(grep("jpg$",file)))
      jpeg(file,...)  
    if (length(grep("pdf$",file)))
      if (!onefile)
        pdf(file,...)                              
  }

  plot(survfit(y~x),xlab="time",ylab="survival", mark.time=FALSE, lty=1:nlevels(x))
  title(main = paste("K-M survival of '",var.label.y,"' by '",var.label.x,"'", sep=""))
  legend("bottomleft",levels(x), lty=1:nlevels(x))
  
  if (!is.null(file) && (length(grep("pdf$",file))==0 || !onefile))
    dev.off()
     
}




