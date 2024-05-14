package org.devyntubac.controller;

import java.net.URL;
import org.devyntubac.system.Main;
import java.util.ResourceBundle;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.MenuItem;

/**
 *
 * @author Devyn Orlando Tubac Gomez Carne: 2020247 Codigo Tecnico: IN5BM Fecha
 * de Creación: 10/04/2024 Fecha de Modificaciones: 24/04/2024
 */
public class MenuPrincipalController implements Initializable {
    private Main escenarioPrincipal;

    @FXML MenuItem btnMenuClientes;
    @FXML MenuItem btnMenuProgramador;
    
    @Override
    public void initialize(URL location, ResourceBundle resources) {
        
    }

    public Main getEscenarioPrincipal() {
        return escenarioPrincipal;
    }

    public void setEscenarioPrincipal(Main escenarioPrincipal) {
        this.escenarioPrincipal = escenarioPrincipal;
    }
    
    @FXML
    public void handleButtonAction(ActionEvent event){
        if(event.getSource() == btnMenuClientes){
            escenarioPrincipal.menuClientesView();
        }
        if(event.getSource() == btnMenuProgramador ){
            escenarioPrincipal.menuProgramadorView();
        }
    }
    
    
}
