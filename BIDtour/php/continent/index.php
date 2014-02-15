<?php


$db = new PDO ( "mysql:host=localhost;dbname=bidtour", "root", "" );

$nId = 0;
// check if last part of url is numeric
$aUrls = explode('/', $_SERVER['REQUEST_URI']);
$sLast =  array_pop($aUrls);
//print_r($aUrls);
if($sLast === ""){
	$sLast =  array_pop($aUrls);
}
if(is_numeric($sLast))
{
	$nId = $sLast;
	$sTable = array_pop($aUrls);
}
else{
	$sTable = $sLast;
}
$sSQL = "SELECT * FROM ";
$sWhere = "";
$aBinds = array();
switch($sTable){
	case 'continent':
		$sSQL .= 'continent';
		if($nId !== 0){
			$sWhere .= 'id = ?';
			array_push($aBinds, $nId);
		}
		break;
	case 'homepage':
			$sSQL = 'SELECT a.*, b.url FROM places AS a, images AS b';
			$sWhere .= 'a.id = b.place_id AND b.sequence_id = 1';
			array_push($aBinds, array_pop($aUrls));
			if($nId !== 0){
				$sWhere .= ' AND a.id = ?';
				array_push($aBinds, $nId);
			}
			break;
	case 'places':
		$sSQL = 'SELECT a.*, b.url FROM places AS a, images AS b';
		$sWhere .= 'a.id = b.place_id AND b.sequence_id = 1 AND continent_id = ?';
		array_push($aBinds, array_pop($aUrls));
		if($nId !== 0){
			$sWhere .= ' AND a.id = ?';
			array_push($aBinds, $nId);
		}
		break;
	case 'images':
		$sSQL .= 'images';
		$sWhere .= 'place_id = ?';
		array_push($aBinds, array_pop($aUrls));
		if($nId !== 0){
			$sWhere .= ' AND sequence_id = ?';
			array_push($aBinds, $nId);
		}
		break;
	default:
		throw(new Exception("bad path " . $sTable));
}
if($nId !== 0){
	// get a single item
	$stmt = $db->prepare($sSQL . " WHERE ". $sWhere);
	$stmt->execute($aBinds);
	$result = $stmt->fetchObject();
} else {
	// get all of the items
	if($sWhere != ""){
		$sSQL .= " WHERE " . $sWhere;
	}
	$stmt = $db->prepare($sSQL);
	$stmt->execute($aBinds);
	$result = $stmt->fetchAll ( PDO::FETCH_OBJ );
}
echo json_encode($result);

?>