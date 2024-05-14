package org.devyntubac.controller;

import java.net.URL;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.scene.image.ImageView;
import org.devyntubac.bean.Clientes;
import org.devyntubac.db.Conexion;
import org.devyntubac.system.Main;

/**
 * FXML Controller class
 *
 * @author Devyn Orlando Tubac Gomez Carne: 2020247 Codigo Tecnico: IN5BM Fecha
 * de Creación: 10/04/2024 Fecha de Modificaciones: 24/04/2024
 */
public class MenuClientesController implements Initializable {

    @FXML private TextField txtcodigoCliente;
    @FXML private TextField txtNombreCliente;
    @FXML private TextField txtApellidoCliente;
    @FXML private TextField txtNitCliente;
    @FXML private TextField txtTelefonoCliente;
    @FXML private TextField txtDireccionCliente;
    @FXML private TextField txtCorreoCliente;
    @FXML private TableView tblClientes;
    @FXML private TableColumn colClienteID;
    @FXML private TableColumn colNombresCliente;
    @FXML private TableColumn colApellidosCliente;
    @FXML private TableColumn colNitClientes;
    @FXML private TableColumn colTelefonoCliente;
    @FXML private TableColumn colDireccionCliente;
    @FXML private TableColumn colCorreoCliente;
    @FXML private ImageView imgAgregar;
    @FXML private ImageView imgEliminar;
    @FXML private ImageView imgEditar;
    @FXML private Button btnRegresar;
    private ObservableList<Clientes> listarClientes;
    private Main escenarioPrincipal;
    
    public Main getEscenarioPrincipal() {
        return escenarioPrincipal;
    }

    public void setEscenarioPrincipal(Main escenarioPrincipal) {
        this.escenarioPrincipal = escenarioPrincipal;
    }

    /**
     * Initializes the controller class.
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        cargarDatos();
    }
    
    public void cargarDatos(){
        tblClientes.setItems(getClientes());
        colClienteID.setCellValueFactory(new PropertyValueFactory<>("clienteID"));
        colNombresCliente.setCellValueFactory(new PropertyValueFactory<>("nombresCliente"));
        colApellidosCliente.setCellValueFactory(new PropertyValueFactory<>("apellidosCliente"));
        colNitClientes.setCellValueFactory(new PropertyValueFactory<>("NITClientes"));
        colDireccionCliente.setCellValueFactory(new PropertyValueFactory<>("direccionCliente"));
        colTelefonoCliente.setCellValueFactory(new PropertyValueFactory<>("telefonoCliente"));
        colCorreoCliente.setCellValueFactory(new PropertyValueFactory<>("correoCliente"));
        
    }
    
    public ObservableList<Clientes> getClientes(){
        ArrayList<Clientes> lista = new ArrayList<>();
        ResultSet resultado = null;
        try{
            PreparedStatement procedimiento = Conexion.getInstance().getConexion().prepareCall("call sp_listarClientes();");
            resultado = procedimiento.executeQuery();
            while(resultado.next()){
                lista.add(new Clientes (resultado.getInt("clienteID"),
                                        resultado.getString("nombresCliente"),
                                        resultado.getString("apellidosCliente"),
                                        resultado.getString("NITClientes"),
                                        resultado.getString("telefonoCliente"),
                                        resultado.getString("direccionCliente"),
                                        resultado.getString("correoCliente")
                ));                                   
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return FXCollections.observableList(lista);
    }
    
    public void desactivarControles(){
       txtcodigoCliente.setEditable(false);
       txtNombreCliente.setEditable(false);
       txtApellidoCliente.setEditable(false);
       txtNitCliente.setEditable(false);
       txtTelefonoCliente.setEditable(false);
       txtDireccionCliente.setEditable(false);
       txtCorreoCliente.setEditable(false);
    }
    
    public void activarControles(){
       txtcodigoCliente.setEditable(true);
       txtNombreCliente.setEditable(true);
       txtApellidoCliente.setEditable(true);
       txtNitCliente.setEditable(true);
       txtTelefonoCliente.setEditable(true);
       txtDireccionCliente.setEditable(true);
       txtCorreoCliente.setEditable(true);
    }
    
    public void limpirarControles(){
        txtcodigoCliente.clear();
       txtNombreCliente.clear();
       txtApellidoCliente.clear();
       txtNitCliente.clear();
       txtTelefonoCliente.clear();
       txtDireccionCliente.clear();
       txtCorreoCliente.clear();
    }
    
    @FXML
    public void handleButtonAction(ActionEvent event){
        if(event.getSource() == btnRegresar){
            escenarioPrincipal.menuPrincipalView();
        }
    }
}
