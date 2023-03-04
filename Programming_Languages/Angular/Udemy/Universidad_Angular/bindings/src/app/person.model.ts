export class Person {
  /*
  name: string = '';
  lastName: string = '';

  constructor(name: string, lastName: string) {
    this.name = name;
    this.lastName = lastName;
  }
  */

  constructor(public name: string, public lastName: string) { }

  fullName() {
    return `${this.lastName}, ${this.name}`
  }
}
