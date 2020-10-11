package uz.lesson.db;

import uz.lesson.models.Article;

import java.util.*;

public class ArticleTable {
    private static int sequence = 0;
    private static Map<Integer , Map<Integer, Article>> articleMap = new HashMap<>();

    public static void saveArticle(Article article){
        if (article.getId()==-1){
            article.setId(++sequence);
            article.setCreatedAt(new Date());
            article.setPublished(false);
            article.setSeenCount(0);
        }
        if (articleMap.containsKey(article.getCategoryId())){//edit article
            articleMap.get(article.getCategoryId()).put(article.getId(),article);
        }else {
            articleMap.put(article.getCategoryId(), new HashMap<>());//add article
            articleMap.get(article.getCategoryId()).put(article.getId(),article);
        }
    }

    public static int getArticlesCount(int categoryId){
        if (articleMap.containsKey(categoryId)){
            return articleMap.get(categoryId).size();
        }
        return 0;
    }

    public static Collection<Article>allArticles(int categoryId){
        if (articleMap.containsKey(categoryId)){
            return articleMap.get(categoryId).values();
        }else {
            return Collections.EMPTY_LIST;
        }
    }

    public static void deleteArticleById(int articleId , int categoryId){
        articleMap.get(categoryId).remove(articleId);
    }
    public static Article findArticleById(int categoryId , int articleId){
        return articleMap.get(categoryId).get(articleId);
    }

    public static Article removeArticleById(int categoryId , int articleId){
        return articleMap.get(categoryId).remove(articleId);
    }

    public static void changerticlePublishStatus(int categoryId,int articleId,boolean status){
        articleMap.get(categoryId).get(articleId).setPublished(status);
    }

    public static List<Article> getTopArticles(){
        List<Article> allArticles = new LinkedList<>();
        for(Integer categoryId : articleMap.keySet()){
            for (Integer articleId : articleMap.get(categoryId).keySet()){
                allArticles.add(articleMap.get(categoryId).get(articleId));
            }
        }
        Collections.sort(allArticles, new Comparator<Article>() {
            @Override
            public int compare(Article o1, Article o2) {
                return (int) (o2.getSeenCount() - o1.getSeenCount());
            }
        });
        return allArticles.subList(0, allArticles.size()>=10?10:allArticles.size());
    }
}
