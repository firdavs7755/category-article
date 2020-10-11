package uz.lesson.db;

import uz.lesson.models.Category;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class CategoryTable {
    private static int sequence = 0;

    private static Map<Integer,Category> Cmap = new HashMap<>();

    public static void saveCategory(Category category){
        if (category.getId() == -1){
            category.setId(++sequence);
            Cmap.put(category.getId(),category);
        }else {
            Cmap.put(category.getId(),category);
        }
    }

    public static Collection<Category> allCategories(){
        return Cmap.values();
    }

    public static int getCategoryCount(){
        if (Cmap!=null){
            return Cmap.size();
        }return 0;
    }

    public static void deleteCategory(int id){
        Cmap.remove(id);
    }

    public static Category findCategoryById(int id){
        return Cmap.get(id);
    }
}
