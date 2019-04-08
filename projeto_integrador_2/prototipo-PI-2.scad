
/*------- Parámetros --------*/

fn = 100;                                       // quant. mínima de fragmentos p/renderização

diametro_cano_pvc = 100;                        // diâmetro do cano de PVC em mm.
espessura_pvc = 1.8;                            // espessura do cano de PVC em mm.

diametro_ventoinha = diametro_cano_pvc - 5;     // diâmetro da ventoinha em mm.
altura_ventoinha = 20;                          // altura da ventoinha em mm.

espessura_anel_ext = 2.5;                       // espessura do anel externo da ventoinha em mm.
diametro_anel_int = 23;                         // diâmetro anel interno
diametro_eixo = 3;

quantidade_pas = 6;                             // quantidade de pás
angulo_pas = 45;                                // ângulo das pás em graus.
espessura_pas = espessura_anel_ext * sin(angulo_pas);         // espessura das pás
comprimento_pas = (diametro_ventoinha/2) - 2;                 // cumprimento das pás
altura_pas = (altura_ventoinha/sin(angulo_pas)) + espessura_anel_ext * cos(angulo_pas);    // altura das pás

diametro_dc_motor = diametro_anel_int * 1.4;
altura_dc_motor = diametro_dc_motor * 0.5;

/*---------- Main -----------*/

main();

/*-------- Módulos ----------*/

module main() {
  difference() {
    union() {
      modulo_pas();
      modulo_anel_ext();
      modulo_anel_int();
    }
    
    color("green")
      translate ([0,0,0])
      rotate ([0,0,0])
        cylinder(h=altura_ventoinha + 0.1, d=diametro_eixo, $fn=fn, center=true);
    
    *difference() {
      translate ([0,0,0])
      rotate ([0,0,0])
        cylinder(h=altura_ventoinha, d=diametro_ventoinha + 5, $fn=fn, center=true);
      
      translate ([0,0,0])
      rotate ([0,0,0])
        cylinder(h=altura_ventoinha + 0.1, d=diametro_ventoinha, $fn=fn, center=true);
    }
  }
  
  modulo_eixo();
  modulo_dc_motor();
  *modulo_cano();
}

module modulo_anel_ext() {
  difference() {
    color("yellow")
      translate ([0,0,0]) 
      rotate ([0,0,0]) 
        cylinder(h=altura_ventoinha, d=diametro_ventoinha, $fn=fn, center=true);          
                          
    color("green")
      translate ([0,0,0])
      rotate ([0,0,0]) 
        cylinder(h=altura_ventoinha + 0.1, d=diametro_ventoinha - espessura_anel_ext*2, $fn=fn, center=true);                                           
  }
}

module modulo_anel_int() {
  difference() {
    color("red")
      translate ([0,0,0])
      rotate ([0,0,0])
        cylinder(h=altura_ventoinha, d=diametro_anel_int, $fn=fn, center=true);
  }
}

module modulo_pas() {
  difference() {
    color("blue")
      for (i=[0:(360/quantidade_pas):360]) {
    
        theta=i;
        
        x = ((comprimento_pas/2) * cos(theta));
        y = ((comprimento_pas/2) * sin(theta));
        
        translate([x,y,0])
        rotate([angulo_pas,0,theta])
          cube([comprimento_pas, espessura_pas, altura_pas], center=true);
      };
    
    altura_tampas = espessura_anel_ext * sin(angulo_pas) * cos(angulo_pas);
    
    color("red")
      translate([0,0,(altura_ventoinha + altura_tampas)/2])
      rotate ([0,0,0])
        cylinder(d=diametro_ventoinha + 5, h=altura_tampas, $fn=fn, center=true);
    
    color("red")
      translate([0,0,-(altura_ventoinha + altura_tampas)/2])
      rotate ([0,0,0])
        cylinder(d=diametro_ventoinha + 5, h=altura_tampas, $fn=fn, center=true);
  }
}

module modulo_cano() {
  difference() {
    color("yellow")
      translate([0,0,0]) rotate([0,0,0]) 
        cylinder(d=diametro_cano_pvc, h=altura_ventoinha * 4, $fn=fn, center=true);
    color("red")
      translate([0,0,0]) rotate([0,0,0])
        cylinder(d=diametro_cano_pvc - espessura_pvc, h=(altura_ventoinha * 4) + 0.1, $fn=fn, center=true);
  }
}

module modulo_dc_motor() {
  color("green")
    translate([0,0,-((altura_ventoinha + altura_dc_motor)/2 + 2)]) rotate([0,0,0])
      cylinder(d=diametro_dc_motor, h=altura_dc_motor, $fn=fn, center=true);
}

module modulo_eixo() {
  color("yellow")
    translate([0,0,-(altura_dc_motor/2 + 1)]) rotate([0,0,0])
      cylinder(d=diametro_eixo, h=altura_ventoinha + altura_dc_motor + 8, $fn=fn, center=true);
}

