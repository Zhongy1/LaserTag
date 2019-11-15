export class StringDecoder {
    constructor() {}

    static toJSON(str: string) {
        return {};
    }

    private static isHex(hex: string): boolean {
        let regex: RegExp = new RegExp('^[0-9a-fA-F]+$');
        return regex.test(hex);
    }

    static hexToString(hex: string): string {
        let str: string = '';

        if (this.isHex(hex)) {
            for (let i = 0; (i < hex.length && hex.substr(i, 2) !== '00'); i += 2)
                str += String.fromCharCode(parseInt(hex.substr(i, 2), 16));
            return str;
        }
        else {
            return null;
        }
    }
}
