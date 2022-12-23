class Vehicle {
    void method() {
        System.out.println("Vehicle method");
    }
}

class Car extends Vehicle {
    void method(int a) {
        System.out.println("Car method");
    }
}

class Example {
    public static void main(String args[]) {
        Vehicle v = new Car();
        Car c = new Car();

        v.method();
        c.method(5);
    }
}
