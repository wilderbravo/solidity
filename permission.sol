// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 < 0.9.0;

contract Permission {
    address private owner; //Variable para almacenar la dirección del dueño del contrato
    string public projectName = "Wilder";//NOmbre del proyecto

    //Constructor de la clase
    constructor(){
        owner = msg.sender;//Obtener dirección del contrato
    }
    //Function Modifier que valida que quien ejecuta la función es el owner del contrato
    modifier onlyOwner() {
        require(//Parámetros obligatorios
            msg.sender == owner,//Condición que debe validar
            "Only owner can change the project name"//Mensaje cuando la condición no se cumpla
        );
        _;//Debe ir obligatorio
        //La función será insertada donde aparece el símbolo _
    }
    //Función pública para cambiar el nombre del proyecto
    function changeProjectName(string memory _projectName) public onlyOwner {
        projectName = _projectName;
    }
}