package cn.itweet.modules.admin.article.repository;

import cn.itweet.modules.admin.article.entity.Categories;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by whoami on 16/04/2017.
 */
@Repository
@Transactional
public interface CategoriesRepository extends JpaRepository<Categories,Integer> {

    @Query("from Categories where name=?1")
    Categories getCategoriesByName(String name);

}