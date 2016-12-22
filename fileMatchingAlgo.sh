 #!/bin/bash
    
    
    SourceFilePath='./SourceFile'
    DestFilePath='/home/oshada/Desktop/Tharaka/ItosForms/*'
    SOURCEFILECOUNT=1
    SourceFileNme="*.fmx"
    DestFileExtention=".fmb"
    CREATEDATESOURCE=0
    mkdir findfiles;
    cat log.txt
    for c in $SourceFileNme;do
           echo source_file_count : $SOURCEFILECOUNT 
           DestFileName=$c
           DestFileName=${DestFileName##*/}
           DestFileName=${DestFileName%.*}
           DestFileName=$DestFileName$DestFileExtention
           RepBy="_**_"
           RepPatt=" "
           DestFileName=$DestFileName | tr -s "$RepBy" "$RepPatt"
           echo c_value_is $c >> log.txt
           echo need_to_find : $DestFileName
           echo source_file_name : $DestFileName >> log.txt
           
           COUNTFILETYOE=0
           CREATEDATESOURCE=stat -f "%Sm" $i
           echo source_file_create_date_ : $CREATEDATESOURCE >> log.txt
           CREATEDATEDEST=0
           echo ceate_date_source_file : $CREATEDATESOURCE
           DATEMATCHCOUNT=0
        for i in $(find $DestFilePath  -name $DestFileName); do
             
             CREATEDATEDEST=stat -f "%Sm" $i
             let SOURCEFILECOUNT=SOURCEFILECOUNT+1 
                echo find_file : $i >> log.txt
                if [ $CREATEDATESOURCE = "$CREATEDATEDEST" ];
                then
                    let DATEMATCHCOUNT=DATEMATCHCOUNT+1 
                    echo $(tput setaf 1)$DATEMATCHCOUNT match_found $(tput sgr0)
                    
                     cp $i findfiles;
                     echo $DATEMATCHCOUNT match_found >> log.txt
                     stat $i >> log.txt

                     
                     echo $(tput setaf 2)compair_result : file_name : $DestFileName file_path : $i $(tput sgr0)
                     
                fi
             done
           echo ++++++++++++++++matching_for_next_source_file++++++++++++  >>log.txt
         
      
   echo ++++++++++++++++matching_for_next_source_file++++++++++++

     done





