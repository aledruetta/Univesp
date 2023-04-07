export class Utilities {
  static capitalize(text: string): string {
    return text.split(' ')
               .map(palabra => palabra.charAt(0).toUpperCase() + palabra.slice(1))
               .join(' ');
  }
}
