<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Service extends CI_Controller
{
    public $configuracion = [];

    public function __construct()
    {
        parent::__construct();
        $this->configuracion = basedetalleregistro('base_configuracion', ['id' => 1]);
        $this->configuracion['logo'] = ($this->configuracion['logo'] == '') ? 'public/img/recursos/logo.png' : $this->configuracion['logo'];
        $this->load->helper('text');
        $this->load->model('GenericoModelo', 'generico_modelo');
    }

    public function contacto()
    {
        $this->form_validation->set_rules('name', 'name', 'trim|required');
        $this->form_validation->set_rules('phone', 'phone', 'trim|required');
        $this->form_validation->set_rules('email', 'email', 'trim|required');
        $this->form_validation->set_rules('sub', 'sub', 'trim');
        $this->form_validation->set_rules('msg', 'msg', 'trim|required');
        $this->form_validation->set_rules('recaptcha_response', 'recaptcha_response', 'required');

        if ($this->form_validation->run() == false) {
            response(['message'=>'Parámetros incorrectos'], 500);
        } else {
            $recaptcha_response = $this->input->post('recaptcha_response');
            $secret = '6Ld4Tw0qAAAAAMMSQjjx1S5LifkYTDj1h2_Q-9k8';
            $verifyResponse = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret='.$secret.'&response='.$recaptcha_response);
            $responseData = json_decode($verifyResponse);
            if ($responseData->success) {
                $inputs['nombres'] = $this->input->post('name');
                $inputs['telefono'] = $this->input->post('phone');
                $inputs['correo'] = $this->input->post('email');
                $inputs['asunto'] = $this->input->post('sub');
                $inputs['mensaje'] = $this->input->post('msg');
                $inputs['fecha'] = date('Y-m-d H:i:s');
                $registro = basenuevoregistro($inputs, 'proceso_contacto_externo', []);
                if ($registro) {
                    $message = 'Datos registrados, nos pondremos en contacto.';
                    response(['message'=>$message], 200);
                } else {
                    $message = 'Ocurrió un problema, intente en unos momentos.';
                    response(['message'=>$message], 500);
                }
            } else {
                response(['message'=>'Captcha inválido, intente nuevamente.'], 500);
            }
        }
    }
}
