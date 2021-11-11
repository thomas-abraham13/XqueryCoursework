xquery version "1.0";
<bncDoc>
{
    let $doc := collection("./?select=*xml")
    let $result := $doc//w[matches(.,'^has')]
    for $i at $iPos in $result
    for $j at $jPos in $result/following-sibling::w[1]
    return <target>
    {
        ($i,$j)
    }
    </target>
}
</bncDoc>