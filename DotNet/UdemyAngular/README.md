# New Project

```
ng new project-name --no-strict --skip-tests
```

# Bootstrap

```
npm install bootstrap --save
npm install --save @ng-bootstrap/ng-bootstrap
```

angular.json
```
"styles": [
    "src/styles.css",
    "node_modules/bootstrap/dist/css/bootstrap.min.css"
]
```
app.module.ts
```
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';

@NgModule({
  imports: [ NgbModule.forRoot(), ... ],  
  // ...
})
export class AppModule {}
```