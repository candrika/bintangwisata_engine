<?php

function count_days($sd,$nd){
	$date1 = new DateTime($sd);
	$date2 = new DateTime($nd);

	return $date2->diff($date1)->format("%a");
}

function backdate2($d)
{
    $tgl = explode("-", $d);
    return $tgl[2].'-'.$tgl[1].'-'.$tgl[0];
}

function backdate3($d)
{
    $tgl = explode("/", $d);
    return $tgl[2].'-'.$tgl[1].'-'.$tgl[0];
}

function ddmmyyy($d)
{
	// echo $d;die;
    $tgl = explode("-", $d);
    return $tgl[0].'-'.$tgl[1].'-'.$tgl[2];
}

function count_year($sd,$nd){
	$d1 = new DateTime($sd);
	$d2 = new DateTime($nd);

	$diff = $d2->diff($d1);

	return $diff->y;
}

function getNoMonth($d)
{
     $arrMonth = array('January' => '01', 'February' => '02', 'March' => '03', 'April' => '04', 'May' => '05', 'June' => '06', 'July' => '07', 'August' => '08', 'September' => '09', 'October' => '10', 'November' => '11', 'December' => '12');
    // // explode(delimiter, string)
    return $arrMonth[$d];
}

function getMonth($d)
{
     $arrMonth = array('1'=>'January', '2'=>'February', '3'=>'March', '4'=>'April', '5'=>'May', '6'=>'June' , '7' => 'July','8' => 'August' ,'9' => 'September', '10'=>'October' ,'11'=> 'November','12' => 'December');
    // // explode(delimiter, string)
    return $arrMonth[$d];
}

function ambilBulan($i) {
    $arrMonth = array('01' => 'Januari', '02' => 'Februari', '03' => 'Maret', '04' => 'April', '05' => 'Mei', '06' => 'Juni', '07' => 'Juli', '08' => 'Agustus', '09' => 'September', '10' => 'Oktober', '11' => 'November', '12' => 'Desember');
    return $arrMonth[$i];
}

function ambilNoBulan($i) {
    $arrMonth = array('Januari' => '01', 'Februari' => '02', 'Maret' => '03', 'April' => '04', 'Mei' => '05', 'Juni' => '06', 'Juli' => '07', 'Agustus' => '08', 'September' => '09', 'Oktober' => '10', 'November' => '11', 'Desember' => '12');
    // echo $arrMonth[$i];
    return $arrMonth[$i];
}

function time_elapsed_string($datetime, $full = false) {
    $now = new DateTime;
    $ago = new DateTime($datetime);
    $diff = $now->diff($ago);

    $diff->w = floor($diff->d / 7);
    $diff->d -= $diff->w * 7;

    $string = array(
        'y' => 'year',
        'm' => 'month',
        'w' => 'week',
        'd' => 'day',
        'h' => 'hour',
        'i' => 'minute',
        's' => 'second',
    );
    foreach ($string as $k => &$v) {
        if ($diff->$k) {
            $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
        } else {
            unset($string[$k]);
        }
    }

    if (!$full) $string = array_slice($string, 0, 1);
    return $string ? implode(', ', $string) . ' ago' : 'just now';
}

?>