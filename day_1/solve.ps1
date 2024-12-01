$data = get-content data.txt
$data = $data.split('`n')
$l1 = @()
$l2 = @()
$data | % {
    $d = $_.split(' ')
    $n1 = [int]$d[0]
    $n2 = [int]$d[-1]
    $l1 += $n1
    $l2 += $n2
}

$l1 = $l1 | sort-object
$l2 = $l2 | sort-object

$s = 0
(0..$l1.length) | % {
    $s += [Math]::Abs($l1[$_]-$l2[$_])
}
write-host "Solution 1: $s"

$s = 0
$l1 | % {
    $outer = $_
    $tmp = $l2 -match $outer
    $s += ($tmp|measure).Count * $_
}
write-host "Solution 2: $s"