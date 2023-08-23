import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { HttpClientModule } from '@angular/common/http'
import { RouterModule, Routes } from '@angular/router'
import { ReactiveFormsModule } from '@angular/forms'

import { AppComponent } from './app.component';
import { MainComponent } from './components/main.component';
import { CardsComponent } from './components/cards.component';
import { CardsService } from './cards.service'

const appRoutes: Routes = [
  { path: '', component: MainComponent, title: 'Deck of Cards' },
  { path: 'deck/:id', component: CardsComponent },
  { path: '**', redirectTo: '/', pathMatch: 'full' },
]

@NgModule({
  declarations: [
    AppComponent,
    MainComponent, CardsComponent
  ],
  imports: [
    BrowserModule, HttpClientModule, ReactiveFormsModule,
    RouterModule.forRoot(appRoutes)
  ],
  providers: [ CardsService ],
  bootstrap: [AppComponent]
})
export class AppModule { }
