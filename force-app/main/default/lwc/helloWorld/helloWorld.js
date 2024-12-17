import { LightningElement } from 'lwc';

export default class HelloWorld extends LightningElement {

    clickedButtonLabel

    handleClick(event){
           this.clickedButtonLabel = event.target.label;
    }
    
}