xquery version "1.0";

<html>
    <body>
        <table style="border:2px solid black">
            <tr style ="background-color: #e2e2e2; padding: 5px">
                <td style="font-weight:bold">
                    <i>Target</i>
                </td>
                <td style="font-weight:bold">
                    <i>Successor</i>
                </td>
            </tr>
            {
                let $doc := collection("./?select=*xml")
                let $result := $doc//w[matches(.,'^has')]
                for $succ in ($result/lower-case(normalize-space(following-sibling::w[1])))
                return
                    <tr>
                        <td>
                            {"has"}
                        </td>
                        <td>
                            {$succ}
                        </td>
                    </tr>
            }
        </table>            
    </body>
</html>