export class StringDecoder {
    constructor() {}

    static toJSON(str: string) {
        return {};
    }

    static hexToString(hex: string) {
        let str: string = '';
        for (let i = 0; (i < hex.length && hex.substr(i, 2) !== '00'); i += 2)
            str += String.fromCharCode(parseInt(hex.substr(i, 2), 16));
        return str;
    }
}
