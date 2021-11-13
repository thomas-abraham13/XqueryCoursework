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
                    <i><b>Probability</b></i>
                </td>
            </tr>
            {
                let $doc := collection("./?select=*xml")
                let $result := $doc//w[matches(.,'^has')]
                for $succ in distinct-values($result/lower-case(normalize-space(following-sibling::w[1])))
                let $wrdcount := $result/lower-case(normalize-space(following-sibling::w[1]))[. = $succ]
                let $overall := $doc//w[matches(.,$succ)]
                let $prob := (count($wrdcount) div count($overall))
                order by count($prob) descending
                return
                    <tr>
                        <td>
                            {count($wrdcount)}
                        </td>
                        <td>
                            {count($overall)}
                        </td>
                        <td>
                            {$prob}
                        </td>
                    </tr>
            }
        </table>            
    </body>
</html>