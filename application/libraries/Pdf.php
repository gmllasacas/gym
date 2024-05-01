<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

require_once dirname(__FILE__) . '/tcpdf/tcpdf.php';

class Pdf extends TCPDF{
    private $footertext ;
	function __construct($footertext , $orientation){
        parent::__construct( $orientation, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false );
        $this->footertext = $footertext ;
	}
	public function Footer() {
		$this->SetY(-16);
		$this->SetFont('helvetica', '', 7);
		//$this->Cell(0, 10, $this->footertext, 0, false, 'C', 0, '', 0, false, 'T', 'M');
		$this->writeHTMLCell(0, 0, '', '', $this->footertext, 0, 0, false, "T", "M");
	}
}
