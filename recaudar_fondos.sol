// SPDX-License-Identifier: GPL-3.0
 pragma solidity >=0.7.0 <0.9.0;
 
 contract CrowdFunding{
     //Sección de variables
     bool isFundable;
     uint256 public Goal; 
     string public Name;
     string public Description;
     uint256 totalFunded;
     address payable public owner;
     uint256 requiredFunds;
     
     //Método constructor
     constructor(){
         Goal = 0;
         owner = payable(msg.sender);
         totalFunded = 0;
         isFundable = isFundable;
         Name = Name;
         Description = Description;
     }
     //Estar seguro que solo el creador del contrato pueda camiar la meta
     modifier onlyOwner{
         require(
             msg.sender == owner, 
             "Only owner can to change the goal");
         _;
     }
     modifier isNotOwner(){
         require(
             msg.sender != owner,
             "The owner can't fund his own project");
         _;
     }
     //Seteo del total a recaudar
     function setGoal(uint256 goal) public onlyOwner {
         Goal = goal;
     }
     //Visualización de lo recaudado
     function viewGoal() public view returns(uint256) {
         return Goal;
     }
     //Cambiar estado del proyecto
     function changeProjectState(bool change)public onlyOwner{
         isFundable = change;
     }
     //Función principal
     function fundProject() public payable isNotOwner {
         //Primero evaluamos si el owner del contrato mantiene abiertas las donaciones (tal vez necesita reevaluar algo)
         require(isFundable, "Owner has decided to stop this fundraising for a while. Stay tuned");
         //Comprobamos que el total que se ha fondeado sea menor a la meta
         require(totalFunded < Goal, "Goal already achieved so you are  not able to fund this anymore");
         //Despues nos aseguramos que la persona mande un minimo,en este caso arriba de 0
         require(msg.value > uint(0), "Please add some funds to  contribuite to project");
         //Comprobamos que el valor que quiere fondear no exceda con a meta que tenemos
         require(totalFunded + msg.value <= Goal,"unable to add more funds, check amount remaining for our goal");
         //Actualizamos el total que se ha fondeado al contrato
         totalFunded += msg.value;
     }
     //Visualización del valor restante para llegar a la meta
     function viewRemaining() public view returns(uint256){
         uint256 remainingFunds = Goal - totalFunded;
         return remainingFunds;
     }
     
 }