xquery version "1.0";

<html>
    <body>
        <table style="border:2px solid black">
            <tr style ="background-color: #d2d2d2; padding: 5px">
                <td style="font-weight:bold">
                    Target
                </td>
                <td style="font-weight:bold">
                    Successor
                </td>
                <td style="font-weight:bold">
                    Frequency
                </td>
            </tr>
            {
                let $key := "has"
                let $document_collection := collection("./?select=*xml")
                let $words := $document_collection//s//w[lower-case(normalize-space()) = $key]
                for $distinct_successor in distinct-values($words/lower-case(normalize-space(following-sibling::w[1])))
                let $count_words := $words/lower-case(normalize-space(following-sibling::w[1]))[. = $distinct_successor]
                order by count($count_words) descending
                return
                    <tr>
                        <td>
                            {$key}
                        </td>
                        <td>
                            {$distinct_successor}
                        </td>
                        <td>
                            {count($count_words)}
                        </td>
                    </tr>
            }
        </table>            
    </body>
</html>