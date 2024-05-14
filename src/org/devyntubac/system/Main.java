package org.devyntubac.system;

import java.io.IOException;
import java.io.InputStream;
import java.security.Principal;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.fxml.JavaFXBuilderFactory;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;
import org.devyntubac.controller.MenuClientesController;
import org.devyntubac.controller.MenuPrincipalController;
import org.devyntubac.controller.MenuProgramadorController;

/**
 *
 * @author Devyn Orlando Tubac Gomez Carne: 2020247 Codigo Tecnico: IN5BM Fecha
 * de Creación: 10/04/2024 Fecha de Modificaciones: 24/04/2024
 */
public class Main extends Application {

    private Stage escenarioPrincipal;
    private Scene escena;

    @Override
    public void start(Stage escenarioPrincipal) throws IOException {
        this.escenarioPrincipal = escenarioPrincipal;
        this.escenarioPrincipal.setTitle("KinalXpress");
        escenarioPrincipal.getIcons().add(new Image("/org/devyntubac/images/logoXpress.png"));
        menuPrincipalView();
        //Parent root = FXMLLoader.load(getClass().getResource("/org/devyntubac/view/MenuPrincipalView.fxml"));
        //Scene escena = new Scene(root);
        //escenarioPrincipal.setScene(escena);
        escenarioPrincipal.show();
    }
    
    public Initializable cambiarEscena(String fxmlname,int width, int heigth) throws IOException {
        Initializable resultado;
        FXMLLoader loader = new FXMLLoader();
        InputStream file = Principal.class.getResourceAsStream("/org/devyntubac/view/" + fxmlname);
        loader.setBuilderFactory(new JavaFXBuilderFactory());
        loader.setLocation(Principal.class.getResource("/org/devyntubac/view/" + fxmlname));
        
        escena = new Scene((AnchorPane)loader.load(file), width, heigth);
        escenarioPrincipal.setScene(escena);
        escenarioPrincipal.sizeToScene();
        escenarioPrincipal.centerOnScreen();
        
        resultado = (Initializable)loader.getController();
        
        return resultado;
    }
    
        public void menuPrincipalView (){
        try{
            MenuPrincipalController menuPrincipalView = (MenuPrincipalController)cambiarEscena("MenuPrincipalView.fxml", 600,400);
            menuPrincipalView.setEscenarioPrincipal(this);  
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void menuClientesView(){
        try{
           MenuClientesController menuClientesView = (MenuClientesController)cambiarEscena("MenuClientes.fxml",1020,675); 
           menuClientesView.setEscenarioPrincipal(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
    
    public void menuProgramadorView(){
        try{
            MenuProgramadorController menuProgramadorView = (MenuProgramadorController)cambiarEscena("viewPresentacion.fxml",566,534);
            menuProgramadorView.setEscenarioPrincipal(this);
        }catch(Exception e){
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        launch(args);
    }

}
