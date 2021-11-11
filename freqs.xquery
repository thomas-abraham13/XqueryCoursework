xquery version "1.0";
<bncDoc>
{
    let $doc := collection("./?select=*xml")
    let $result := $doc//w[matches(.,'^has')]
    for $i at $iPos in $result
    for $j at $jPos in $result/following-sibling::w[1]
    
    let $s := "has"
    let $x := doc("KS0.xml")//u//s//w[lower-case(normalize-space()) = $s]
    for $w in distinct-values($x/following-sibling::w[1])
    let $g := $x/following-sibling::w[1][. = $w]
    order by count($g) descending
    return <tr>
           <td>{$s}</td>
           <td>{$w}</td>
           <td>{count($g)}</td>
       </tr>
    
}
</bncDoc>