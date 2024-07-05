<?php
require_once dirname(__FILE__) . '/tcpdf/tcpdf.php';

/**
 * Use it like this:
 * $this->load->library('Pdf');
 * $pdf = new Pdf('footerText', 'headerText', PDF_PAGE_ORIENTATION, PDF_UNIT, PDF_PAGE_FORMAT, true, 'UTF-8', false);
 *
 */

class Pdf extends tcpdf
{
    private $headerText ;
    private $footerText ;

    public function __construct($headerText = '', $footerText = '', $orientation = 'P', $unit = 'mm', $format = 'A4', $unicode = true, $encoding = 'UTF-8', $diskcache = false, $pdfa = false)
    {
        parent::__construct($orientation, $unit, $format, $unicode, $encoding, $diskcache, $pdfa);
        $this->headerText = $headerText ;
        $this->footerText = $footerText ;
    }
    /*public function Header()
    {
        $image_file = K_PATH_IMAGES.'logo_example.jpg';
        $this->Image($image_file, 10, 10, 15, '', 'JPG', '', 'T', false, 300, '', false, false, 0, false, false, false);
        $this->SetFont('helvetica', 'B', 20);
        $this->Cell(0, 15, '<< TCPDF Example 003 >>', 0, false, 'C', 0, '', 0, false, 'M', 'M');
    }*/

    public function Footer()
    {
        $this->SetY(-15);
        $this->SetFont('helvetica', 'I', 8);
        $this->Cell(0, 10, 'Page '.$this->getAliasNumPage().'/'.$this->footerText, 0, false, 'C', 0, '', 0, false, 'T', 'M');
    }
}
