xquery version "1.0";
<bncDoc>
{
    let $doc := collection("./?select=*xml")
    let $result := $doc//w[matches(.,'^has')]
    for $i at $iPos in $result
    for $j at $jPos in distinct-values($result/following-sibling::w[1])
    
    let $k := $result/following-sibling::w[1][. = $j]
    order by count($k) descending
    
    return <tr>
           {$i,$k,count($k)}
       </tr>
}
</bncDoc>