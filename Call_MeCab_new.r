Call_MeCab_new<-function(input){
      pseudo_input<-paste0("！", input)
      command_M<-paste("echo", pseudo_input, "| mecab -b 5242880")
      # command_M<-paste("echo", input, "| mecab -b 5242880")
      res_M<-system(command_M, intern=TRUE) %>% str_subset("^(?!EOS)") %>% str_replace_all("\\t",",") %>% str_split_fixed(pattern=",",10)
      # res_M<-res_M%>%fun_rough_merge()
      res_M<-res_M[-1,]
      return(res_M)
}