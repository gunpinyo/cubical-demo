{-# OPTIONS --cubical #-}

open import PathPrelude hiding (eqToPath')


-- Glue : ∀ {a b} (A : Set a) →
--        ∀ φ → (T : Partial (Set b) φ) (f : (PartialP φ \ o → Equiv (T o) A)) → Set _

eqToPath' : ∀ {l} {A B : Set l} → Equiv A B → Path A B
eqToPath' {l} {A} {B} f = \ i → Glue B (~ i ∨ i) (\ { (i = i0) → A; (i = i1) → B })
                                                 (\ { (i = i0) → f; (i = i1) → idEquiv })
