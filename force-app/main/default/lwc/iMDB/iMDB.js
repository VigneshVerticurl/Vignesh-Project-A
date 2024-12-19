import { LightningElement, wire } from 'lwc';
import getMovieName from '@salesforce/apex/IMDBController.getMovieName';

export default class IMDB extends LightningElement {

    enteredText = '';
    searchText = ''; 
    movies ='';
    title ='';
    

    handleChange(event) {
        this.enteredText = event.target.value;
    }

    handleClick(event) {
        this.searchText = this.enteredText;
    }

    
    @wire(getMovieName,{searchText: '$searchText'})
    fetchMovies(result) 
    {
        console.log(result);
        if(result.data){
            let data = JSON.parse(result.data);

            if(data.success){
                this.movies = data.result;
                this.title = 'Movies List';
            } else {
                this.movies = [];
                this.title = 'Please select the Movie';
            }
        } else if(result.error)
        {
             console.log('Error' + result.error);
             this.title = 'Error' + result.error;
        }
        
    }

}