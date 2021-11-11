xquery version "1.0";
<bncDoc>
{
    let $doc := collection("./?select=*xml")
    let $result := $doc//w[matches(.,'^has')]
    let $tok := $result//text()/fn:tokenize(fn:normalize-space(.),'\s')
    for $i at $iPos in $result
    for $j at $jPos in $result/following-sibling::w[1]
    for $t in distinct-values($tok)
    let $count := count($tok[. = $t])
    return element {$t} 
    {
        attribute count { $count }
    }
    
 
}
</bncDoc>