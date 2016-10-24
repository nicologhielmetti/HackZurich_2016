package com.hackzurich.android;

import android.animation.Animator;
import android.animation.AnimatorSet;
import android.animation.FloatEvaluator;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.app.Activity;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.LinearGradient;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.*;
import android.graphics.Canvas;
import android.view.ViewParent;
import android.view.animation.Animation;
import android.view.animation.LinearInterpolator;
import android.view.animation.RotateAnimation;
import android.widget.ImageView;

import java.sql.Array;
import java.util.ArrayList;
import java.util.List;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Rect;
import android.graphics.Shader;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;

/**
 * Created by Ennio on 17/09/2016.
 */
public class MeterView extends View {

    boolean is_fixed = false;
    int parentWidth;
    int parentHeight;

    float x;
    float f1, f2, f3;
    private AnimatorSet mAnimatorSet;

    private Activity activity = null;

    public interface UpdateInterface {
        void onDriverScoreUpdate(int driverScorePerc);
    }

    private UpdateInterface updateInterface = null;

    public MeterView(Context context, AttributeSet attrs) {
        super(context, attrs);
        TypedArray a = context.getTheme().obtainStyledAttributes(
                attrs,
                R.styleable.MeterView,
                0, 0);

        try {
            is_fixed = a.getBoolean(R.styleable.MeterView_is_fixed, false);
        } finally {
            a.recycle();
        }
        //is_fixed =  attrs.getAttributeBooleanValue("custom", "is_fixed", false);

        setup();
    }

    public MeterView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        is_fixed = attrs.getAttributeBooleanValue("custom", "is_fixed", false);

        setup();
    }

    public MeterView(Context context) {
        super(context);
        setup();
    }

    public float getAlpha(){
        return x;
    }
    public void setAlpha(float value){
        x=value;
    }

    public void setX(float x) {
        this.x = x;
    }

    @Override
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec);

        parentWidth = MeasureSpec.getSize(widthMeasureSpec);
        parentHeight = MeasureSpec.getSize(heightMeasureSpec);

        Log.i("TAG", "Width: " + parentWidth + " Height: " + parentHeight);

        this.setMeasuredDimension(
                parentWidth, (int) (parentHeight / 4.9f));
    }



    public void start() {
        if (mAnimatorSet != null) {
            mAnimatorSet.start();
        }
    }




    protected void setup() {
        if(is_fixed)return;


        List<Animator> animators = new ArrayList<>();


        ValueAnimator animation = ValueAnimator.ofFloat(0.3f, 0.7f);
        animation.setDuration(5000);
        animation.setEvaluator(new FloatEvaluator());
        animation.setRepeatCount(ValueAnimator.INFINITE);
        animation.setRepeatMode(ValueAnimator.REVERSE);
        animation.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
            @Override
            public void onAnimationUpdate(ValueAnimator animation) {
                f1 = (float) animation.getAnimatedValue();
            }
        });
        animation.start();
        animators.add(animation);


        ValueAnimator animation1 = ValueAnimator.ofFloat(-0.1f, 0.1f);
        animation1.setDuration(2000);
        animation1.setEvaluator(new FloatEvaluator());
        animation1.setRepeatCount(ValueAnimator.INFINITE);
        animation1.setRepeatMode(ValueAnimator.REVERSE);
        animation1.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
            @Override
            public void onAnimationUpdate(ValueAnimator animation) {
                f2 = (float) animation.getAnimatedValue();
            }
        });
        animation1.start();
        animators.add(animation1);


        ValueAnimator animation2 = ValueAnimator.ofFloat(-0.1f, 0.1f);
        animation2.setDuration(2000);
        animation2.setEvaluator(new FloatEvaluator());
        animation2.setRepeatCount(ValueAnimator.INFINITE);
        animation2.setRepeatMode(ValueAnimator.REVERSE);
        animation2.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
            @Override
            public void onAnimationUpdate(ValueAnimator animation) {
                f3 = (float) animation.getAnimatedValue();
            }
        });
        animation2.start();
        animators.add(animation2);



        mAnimatorSet = new AnimatorSet();
        mAnimatorSet.playTogether(animators);

    }



    protected void onDraw(Canvas canvas) {

        Shader shader = new LinearGradient(0, 0, parentWidth, 0, getResources().getColor(R.color.red), getResources().getColor(R.color.green), Shader.TileMode.CLAMP);
        Paint paint = new Paint();
        paint.setShader(shader);

        int margin = 0;

        canvas.drawRect(margin, margin, parentWidth - margin, parentHeight - margin, paint);


        Paint paint1 = new Paint();
        paint1.setColor(getResources().getColor(R.color.amber));


        if(!is_fixed) x = f1 + f2 + f3;

        canvas.drawRect((int) (x * parentWidth), 0, (int) (x * parentWidth) + 20, parentHeight, paint1);

        //System.out.println(x);

        if(!is_fixed) invalidate();


        if (updateInterface!=null) {
            updateInterface.onDriverScoreUpdate(getDriverScorePerc());
        }
    }

    public void setActivity(Activity activity) {
        this.activity = activity;
        updateInterface = (UpdateInterface) activity;
    }

    public int getDriverScorePerc(){return (int)((f1+f2+f3)*100);}



}
