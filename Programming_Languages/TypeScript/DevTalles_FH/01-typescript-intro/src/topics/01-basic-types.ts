let skills: string[] = ['Javascript', 'Typescript', 'Angular', 'React', 'Vue'];

interface Character {
    name: string;
    hp: number;
    skills: string[];
    hometown?: string;
}

const strider: Character = {
    name: 'Strider',
    hp: 100,
    skills: ['Run', 'Hide', 'Jump'],
}

console.log(strider);

export {};