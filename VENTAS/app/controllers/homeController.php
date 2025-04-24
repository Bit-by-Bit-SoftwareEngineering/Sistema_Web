<?php
require_once 'app/models/homeModel.php';

class HomeController {
    private $model;

    public function __construct() {
        $this->model = new HomeModel();
    }

    public function index() {
        $empresaInfo = $this->model->getEmpresaInfo();  // Obtener la información de la empresa

        // Asegúrate de que la variable $empresaInfo esté disponible en la vista
        if ($empresaInfo) {
            require './app/views/content/home-view.php';
        } else {
            echo "Error: No se pudo obtener la información de la empresa.";
        }
    }
}
