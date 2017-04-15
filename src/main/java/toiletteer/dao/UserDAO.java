package toiletteer.dao;

import org.springframework.data.repository.CrudRepository;
import toiletteer.models.dao.UserDB;

import javax.transaction.Transactional;

@Transactional
public interface UserDAO extends CrudRepository<UserDB, Long> {
}
