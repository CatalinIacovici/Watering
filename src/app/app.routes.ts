import { Routes } from '@angular/router';
import { WateringDashboard } from './components/watering-dashboard/watering-dashboard';

export const routes: Routes = [
  { path: '', component: WateringDashboard },
  { path: '**', redirectTo: '' }
];
