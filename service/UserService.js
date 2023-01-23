import { GenericService } from './GenericService'

export class UserService extends GenericService {
    constructor() {
        super();
    }
    getAll() {
        super.getAll('GetAllStudent.php');
    }
}