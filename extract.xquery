xquery version "1.0";

<html>  <!-- Author: Thomas Abraham | Student ID: 210639757 -->
    <body>
        <table style="border:2px solid black">
        <tr style ="background-color: #e2e2e2; padding: 5px">   <!-- Table Format: Black Lines and Light Grey Background for first row -->
                <td style="font-weight:bold">
                    <center><i><b>Target</b></i></center>
                </td>
                <td style="font-weight:bold">
                    <center><i><b>Successor</b></i></center>
                </td>
            </tr>
            {
                let $doc := collection("./?select=*xml")    (: function to load all the corpus files together :)
                let $result := $doc//w[matches(.,'^has')]   (: function to check if the supplied string matches a particular string :)
                for $succ in ($result/lower-case(normalize-space(following-sibling::w[1]))) (: following-sibling is used to find a subsequent word where w[1] is the immediate next word :)
                return
                    <tr>
                        <td>
                        <center>
                            {"has"}
                        </center>
                        </td>
                        
                        <td>
                        <center>
                            {$succ}
                        </center>
                        </td>
                    </tr>
            }
        </table>            
    </body>
</html>