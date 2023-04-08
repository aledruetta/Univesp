export class Utilities {
  static capitalize(text: string): string {
    return text.toLocaleLowerCase()
               .split(' ')
               .map(palabra => {
                  palabra = palabra.trim();
                  return palabra.charAt(0).toUpperCase() + palabra.slice(1);
                })
               .join(' ');
  }
}
