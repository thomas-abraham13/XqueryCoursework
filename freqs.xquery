xquery version "1.0";

<html>
    <body>
        <table style="border:2px solid black">
            <tr style ="background-color: #e2e2e2; padding: 5px">
                <td style="font-weight:bold">
                    <i><b>Target</b></i>
                </td>
                <td style="font-weight:bold">
                    <i><b>Successor</b></i>
                </td>
                <td style="font-weight:bold">
                    <i><b>Frequency</b></i>
                </td>
            </tr>
            {
                let $doc := collection("./?select=*xml")
                let $result := $doc//w[matches(.,'^has')]
                for $succ in distinct-values($result/lower-case(normalize-space(following-sibling::w[1])))
                let $wrdcount := $result/lower-case(normalize-space(following-sibling::w[1]))[. = $succ]
                order by count($wrdcount) descending
                return
                    <tr>
                        <td>
                            {"has"}
                        </td>
                        <td>
                            {$succ}
                        </td>
                        <td>
                            {count($wrdcount)}
                        </td>
                    </tr>
            }
        </table>            
    </body>
</html>